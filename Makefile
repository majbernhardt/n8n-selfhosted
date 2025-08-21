NETWORK=proxy

up:
	@docker network inspect $(NETWORK) >/dev/null 2>&1 || docker network create $(NETWORK)
	docker compose --env-file .env up -d

down:
	docker compose down

logs:
	docker compose logs -f

restart:
	make down && make up
