FROM n8nio/n8n:latest

USER root

# Install Python, create venv, and install requests
RUN apk add --no-cache python3 py3-pip && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir requests

# Add venv to PATH for subsequent commands
ENV PATH="/opt/venv/bin:$PATH"

USER node

EXPOSE 5678

CMD ["n8n", "start"]
