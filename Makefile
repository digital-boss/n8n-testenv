build:
	docker build -t n8n-testenv

rebuild:
	docker build --no-cache -t n8n-testenv

up:
	docker compose up -d

down:
	docker compose down
