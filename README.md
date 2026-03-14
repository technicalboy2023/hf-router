HuggingFace Chat Router

OpenAI-compatible router for HuggingFace chat models.

Supports models like:

- Llama
- Gemma
- Mistral
- Zephyr
- Mixtral

---

Features

- Multiple HF API keys
- Round-robin key rotation
- OpenAI compatible chat API
- Model listing
- n8n integration
- systemd auto start

---

Installation

cd /home/aman
mkdir -p routers
cd routers

curl -O https://raw.githubusercontent.com/technicalboy2023/hf-router/main/install-router.sh

chmod +x install-router.sh

sed -i 's/\r$//' install-router.sh

bash install-router.sh hf-router 9000

---

Configure API Keys

nano /home/aman/routers/hf-router/.env

Example:

HF_KEY_1=hf_xxxxx
HF_KEY_2=hf_xxxxx
HF_KEY_3=

Restart router:

sudo systemctl restart hf-router

---

Chat Endpoint

POST /v1/chat/completions

Example:

curl http://localhost:9000/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{
"model":"meta-llama/Llama-3.1-8B-Instruct",
"messages":[{"role":"user","content":"hello"}]
}'

---

Health Check

GET /health

---

License

MIT
