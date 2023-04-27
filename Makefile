build:
	docker build -t n8n-testenv

up:
	docker compose up -d

down:
	docker compose down
