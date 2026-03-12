#!/bin/bash

ROUTER_NAME=$1
PORT=$2

if [ -z "$ROUTER_NAME" ] || [ -z "$PORT" ]; then
  echo "Usage: bash install-router.sh router-name port"
  exit
fi

echo "Installing $ROUTER_NAME on port $PORT..."

sudo apt update
sudo apt install -y python3 python3-venv python3-pip git curl

mkdir -p /home/aman/routers
cd /home/aman/routers

# download router from github
git clone https://github.com/technicalboy2023/$ROUTER_NAME

cd $ROUTER_NAME

echo "Creating virtual environment..."

python3 -m venv venv
source venv/bin/activate

pip install fastapi uvicorn requests

echo "Creating systemd service..."

sudo bash -c "cat > /etc/systemd/system/$ROUTER_NAME.service" <<EOF
[Unit]
Description=$ROUTER_NAME
After=network.target

[Service]
User=aman
WorkingDirectory=/home/aman/routers/$ROUTER_NAME
ExecStart=/home/aman/routers/$ROUTER_NAME/venv/bin/uvicorn router:app --host 0.0.0.0 --port $PORT
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable $ROUTER_NAME
sudo systemctl start $ROUTER_NAME

echo "$ROUTER_NAME installed and running on port $PORT"
