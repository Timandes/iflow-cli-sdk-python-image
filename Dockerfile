FROM python:3.11-slim

ARG IFLOW_CLI_VERSION=0.5.1

RUN groupadd -r iflow && useradd -r -g iflow iflow
USER iflow:iflow

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libpq5 \
        curl \
        ca-certificates \
        gnupg \
        git && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm i -g @iflow-ai/iflow-cli@${IFLOW_CLI_VERSION} && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
