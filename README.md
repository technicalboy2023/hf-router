HuggingFace Chat Router

OpenAI-compatible router for HuggingFace models.

Features

- Multiple HF API keys
- Round-robin key rotation
- OpenAI compatible API
- n8n integration
- Model listing
- Health endpoint

---

Installation

git clone https://github.com/technicalboy2023/hf-router.git
cd hf-router

python3 -m venv venv
source venv/bin/activate
pip install fastapi uvicorn requests python-dotenv

---

Environment Variables

Create ".env":

HF_KEY_1=hf_xxxxxxxxx
HF_KEY_2=hf_xxxxxxxxx
HF_KEY_3=
HF_KEY_4=
HF_KEY_5=

---

Run

uvicorn router:app --host 0.0.0.0 --port 9100

---

API

Chat

POST /v1/chat/completions

Example:

{
"model":"meta-llama/Llama-3.1-8B-Instruct",
"messages":[{"role":"user","content":"hello"}]
}

---

Models

GET /v1/models

---

Health

GET /health

---

n8n Setup

Base URL: http://VPS_IP:9100/v1

---

License

MIT
