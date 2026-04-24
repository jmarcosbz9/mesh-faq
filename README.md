# mesh.bizi.net.br

Guia interativo sobre Redes Mesh domésticas — conceitos, tecnologias e equipamentos com preços no Brasil.

## Stack
- HTML estático (single-file)
- Nginx (Alpine) via Docker
- Deploy: Railway
- DNS: Cloudflare

## Deploy

### 1. Railway
1. Crie um novo projeto em [railway.app](https://railway.app)
2. Conecte este repositório GitHub
3. O Railway detecta o `Dockerfile` automaticamente
4. Em **Settings → Networking**, adicione o domínio customizado: `mesh.bizi.net.br`
5. Copie o valor CNAME gerado pelo Railway (ex: `xxxx.up.railway.app`)

### 2. Cloudflare
1. Acesse o painel da Cloudflare → zona `bizi.net.br`
2. **DNS → Add Record:**
   - Type: `CNAME`
   - Name: `mesh`
   - Target: `xxxx.up.railway.app` ← valor copiado do Railway
   - Proxy: **DNS only** (nuvem cinza) — Railway cuida do SSL
3. Aguarde propagação (geralmente < 5 minutos)

## Desenvolvimento local

```bash
docker build -t bizi-mesh .
docker run -p 8080:8080 bizi-mesh
# Acesse: http://localhost:8080
```

## Atualizar o site

Qualquer `git push` na branch `main` dispara novo deploy automático no Railway.
