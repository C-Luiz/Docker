#!/bin/bash

# Script: run_logs.sh
# Autor: Clebson Luiz da Silva
# Cria volume persistente, roda nginx, gera logs, remove e valida persistência

VOLUME_NAME="nginx_clebson"
CONTAINER_NAME="nginx-log-test"

echo "🧱 Criando volume Docker chamado $VOLUME_NAME..."
docker volume create $VOLUME_NAME

echo "🚀 Iniciando container Nginx com volume montado e porta 8080..."
docker run -d --name $CONTAINER_NAME \
  -p 8080:80 \
  -v $VOLUME_NAME:/var/log/nginx \
  nginx

echo "🌐 Acessando o Nginx localmente para gerar logs..."
curl http://localhost:8080

echo "🛑 Parando e removendo container..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "🚀 Subindo novo container com mesmo volume para verificar persistência..."
docker run -d --name $CONTAINER_NAME \
  -p 8080:80 \
  -v $VOLUME_NAME:/var/log/nginx \
  nginx

echo "📁 Verificando logs antigos dentro do volume (usando container temporário)..."
docker run --rm -v $VOLUME_NAME:/log alpine ls -l /log

echo "✅ Logs persistem entre containers!"

