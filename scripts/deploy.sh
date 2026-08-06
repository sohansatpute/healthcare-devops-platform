#!/bin/bash

set -e

AWS_REGION="ap-south-1"
ECR_REPOSITORY="963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app"

echo "Logging into Amazon ECR..."

aws ecr get-login-password --region ${AWS_REGION} | \
docker login \
--username AWS \
--password-stdin 963910217596.dkr.ecr.ap-south-1.amazonaws.com

echo "Pulling latest image..."

docker pull ${ECR_REPOSITORY}

echo "Stopping containers using port 80..."

docker ps -q --filter "publish=80" | xargs -r docker stop
docker ps -aq --filter "publish=80" | xargs -r docker rm

echo "Removing previous healthcare-app container if exists..."

docker rm -f healthcare-app 2>/dev/null || true

echo "Cleaning unused Docker images..."

docker image prune -f


echo "Starting new container..."

docker run -d \
  --restart unless-stopped \
  --name healthcare-app \
  -p 80:80 \
  ${ECR_REPOSITORY}:latest


echo "Deployment completed successfully."