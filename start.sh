#!/usr/bin/env bash
export NEZHA_SERVER=${NEZHA_SERVER:-''}
export NEZHA_PORT=${NEZHA_PORT:-''}
export NEZHA_KEY=${NEZHA_KEY:-''}
export TLS=${TLS:-'1'}
export ARGO_DOMAIN=${ARGO_DOMAIN:-'domcloudus.xingfriedrich.tk'}
export ARGO_AUTH=${ARGO_AUTH:-'{"AccountTag":"f72aede0bca5d7e5d6e1613b65c479f1","TunnelSecret":"aH5wRgeP6kD8AOsLxEqiCiVqxsRk3Vqh2MBu4aDAFUs=","TunnelID":"193415d8-fda8-4d70-8a89-4ca6a988d1da"}'}
export WSPATH=${WSPATH:-'argo'}
export UUID=${UUID:-'faacf142-dee8-48c2-8558-641123eb939c'}
export CFIP=${CFIP:-'www.udemy.com'}
export NAME=${NAME:-''}
export SERVER_PORT="${SERVER_PORT:-${PORT:-3000}}"
export port1=${port1:-'8080'}

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  DOWNLOAD_URL1="https://github.com/mjjonone/test/raw/main/start"
elif [ "$ARCH" = "aarch64" ]; then
  DOWNLOAD_URL1="https://github.com/mjjonone/test/raw/main/start-arm"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

if [ -e start ]; then
echo "already exists, skipping download."
else
echo "Downloading ..."
curl -sSL "$DOWNLOAD_URL1" -o start
echo "downloaded."
fi

if [ "$ARCH" = "x86_64" ]; then
  DOWNLOAD_URL="https://github.com/mjjonone/mjj/raw/main/run"
elif [ "$ARCH" = "aarch64" ]; then
  DOWNLOAD_URL="https://github.com/mjjonone/mjj/raw/main/run-arm64"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

if [ -e run ]; then
echo "already exists, skipping download."
echo "Running ..."
chmod 755 run
./run
else
echo "Downloading ..."
curl -sSL "$DOWNLOAD_URL" -o run
echo "downloaded."
echo "Running ..."
chmod 755 run
./run
fi
