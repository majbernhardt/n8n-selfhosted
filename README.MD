# n8n в Docker

Файл **docker-compose.yml** с n8n и Traefik, который:

* Проксировует n8n по домену (например, `n8n.example.com`)
* Поднимает HTTPS через **Let's Encrypt** (автоматически)
* Даваёт базовую авторизацию n8n (сами логин/пароль хранится в `.env`)

## Шаги деплоя

1. Настроить DNS:
   У домена `n8n.example.com` должна быть A-запись → на сервер

2. Запустить:

```bash
docker compose up -d
```

3. Через пару минут Traefik подтянет сертификат от Let's Encrypt
4. Проверить: [https://n8n.example.com](https://n8n.example.com)