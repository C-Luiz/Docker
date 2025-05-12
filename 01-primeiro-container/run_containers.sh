#!/bin/bash

# Script: run_containers.sh
# Autor: Clebson Luiz da Silva
# Executa todos os passos da Atividade 01 automaticamente

echo "🔽 Baixando imagem do Nginx..."
docker pull nginx

echo "🚀 Iniciando container 'meu-servidor'..."
docker run -d --name meu-servidor nginx

echo "📋 Listando containers em execução..."
docker ps

echo "🛑 Parando container..."
docker stop meu-servidor

echo "🗑️ Removendo container..."
docker rm meu-servidor

echo "📋 Listando todos os containers (inclusive parados)..."
docker ps -a

