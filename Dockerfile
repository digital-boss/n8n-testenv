FROM node:18-alpine AS base

WORKDIR /app

RUN apk update && \
    apk add git && \
    git clone --depth 1 --branch n8n-nodes-crowd https://github.com/perseus-algol/n8n.git . && \
    git config --global --add safe.directory /app && \
    npm install -g pnpm && \
    pnpm install && \
    pnpm run build

CMD [ "pnpm", "run", "start:tunnel" ]