FROM n8nio/n8n:latest

USER root

RUN python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# Install additional dependencies if needed
RUN apk add --no-cache \
    python3 \
    py3-pip \
    && /opt/venv/bin/pip install --no-cache-dir requests

USER node

EXPOSE 5678

CMD ["n8n", "start"]
