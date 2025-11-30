#!/bin/bash
set -e


REPO_URL="${REPO_URL}"
REPO_BRANCH="${REPO_BRANCH}"
APP_DIR="${APP_DIR}"


apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release git


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io

apt-get install -y docker-compose


usermod -aG docker ubuntu || true


cd /home/ubuntu
if [ -d "app" ]; then
  rm -rf app
fi

git clone --branch "${REPO_BRANCH}" "${REPO_URL}" app
cd app/${APP_DIR}


docker compose build --no-cache || true
docker compose up -d
