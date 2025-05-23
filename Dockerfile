FROM docker:20.10.16-dind

WORKDIR /app

# Install dependencies
RUN apk add --no-cache \
    curl \
    bash \
    nodejs \
    npm \
    docker-compose

# Copy project files
COPY . .

# Expose ports
EXPOSE 5678 8000 11434

# Start command
CMD ["docker-compose", "up", "-d"]
