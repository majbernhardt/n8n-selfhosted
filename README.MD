# self-hosted n8n в Docker

Файл **docker-compose.yml** с n8n и Traefik, который:

* Проксирует n8n по домену (например, `n8n.example.com`)
* Поднимает HTTPS через **Let's Encrypt** (автоматически)
* Устанавливает базовую авторизацию n8n (сам логин/пароль хранится в `.env`)


## **Шаги установки**

### 1. **Настроить DNS:**
   Добавить домену `n8n.example.com` A-запись ведущую на IP сервера

### 2. **Клонировать проект**
```bash
git clone https://github.com/majbernhardt/n8n-selfhosted.git
cd n8n-selfhosted
```

### 3. **Создать сеть для Traefik**
```bash
docker network create proxy
```

### 4. **Настроить `.env` файлы**
Скопировать пример:
```bash
cp .env.example .env
```
#### **Заполнить данные:**
* В `.env`:
  * `N8N_USER` – логин для n8n
  * `N8N_PASSWORD` – пароль для n8n
  * `N8N_HOST` – домен для n8n (например, n8n.example.com)
  * `LETSENCRYPT_EMAIL` – адрес электронной почты для Let's Encrypt
  * `DB_HOST` – IP сервера для PostgreSQL
  * `DB_PORT` – порт для PostgreSQL
  * `DB_NAME` – имя базы данных для PostgreSQL
  * `DB_USER` – имя пользователя для PostgreSQL
  * `DB_PASSWORD` – пароль для PostgreSQL

### 5. **Запустить всё**
```bash
make up
```
Это:
* Проверит сеть `proxy` (создаст если нет)
* Запустит **Traefik** и **n8n**

### 5. **Остановить всё**
```bash
make down
```

### 6. **Логи**
```bash
make logs
```