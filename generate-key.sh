#!/bin/bash
# Generate value for N8N_ENCRYPTION_KEY. Put it in .env.
key=$(openssl rand -hex 16)
echo "Generated key: $key"
