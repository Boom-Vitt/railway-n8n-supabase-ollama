FROM n8nio/n8n:latest

USER root

# Install additional dependencies if needed
RUN apk add --no-cache \
    python3 \
    py3-pip \
    && pip3 install --no-cache-dir requests

USER node

EXPOSE 5678

CMD ["n8n", "start"]
