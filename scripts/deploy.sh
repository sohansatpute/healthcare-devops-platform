#!/bin/bash

set -e

echo "Logging into Amazon ECR..."

aws ecr get-login-password --region ap-south-1 | \
docker login \
--username AWS \
--password-stdin 963910217596.dkr.ecr.ap-south-1.amazonaws.com

echo "Pulling latest image..."

docker pull 963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:latest

echo "Stopping existing container..."

docker stop healthcare-app || true

echo "Removing existing container..."

docker rm healthcare-app || true

echo "Starting new container..."

docker run -d \
  --restart unless-stopped \
  --name healthcare-app \
  -p 80:80 \
  963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:latest

echo "Deployment completed successfully."