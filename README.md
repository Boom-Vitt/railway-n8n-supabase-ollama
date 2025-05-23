# Railway Multi-Service Setup: n8n + Supabase + Ollama

This repository contains Docker configurations for deploying n8n, Supabase, and Ollama on Railway.

## Services Overview

- **n8n**: Workflow automation platform
- **Supabase**: Open source Firebase alternative (Postgres + APIs)
- **Ollama**: Local LLM server

## Repository Structure

```
├── n8n/
│   ├── Dockerfile
│   └── railway.toml
├── supabase/
│   ├── docker-compose.yml
│   ├── volumes/
│   │   ├── db/
│   │   └── api/
│   │       └── kong.yml
│   └── railway.toml
├── ollama/
│   ├── Dockerfile
│   └── railway.toml
├── docker-compose.yml
└── README.md
```

## Quick Deploy to Railway

### Option 1: Individual Services

Deploy each service as a separate Railway project:

[![Deploy n8n](https://railway.app/button.svg)](https://railway.app/template/n8n)

[![Deploy Supabase](https://railway.app/button.svg)](https://railway.app/template/supabase)

### Option 2: All-in-One (Recommended)

1. Fork this repository
2. Connect to Railway
3. Deploy as a monorepo with multiple services

## Environment Variables

### n8n Service
```env
N8N_HOST=your-n8n-domain.railway.app
N8N_PORT=5678
N8N_PROTOCOL=https
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=your-postgres-host
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=your-password
N8N_ENCRYPTION_KEY=your-encryption-key
WEBHOOK_URL=https://your-n8n-domain.railway.app/
```

### Supabase Service
```env
POSTGRES_PASSWORD=your-postgres-password
JWT_SECRET=your-jwt-secret
ANON_KEY=your-anon-key
SERVICE_ROLE_KEY=your-service-role-key
DASHBOARD_USERNAME=supabase
DASHBOARD_PASSWORD=your-dashboard-password
```

### Ollama Service
```env
OLLAMA_ORIGINS=*
OLLAMA_HOST=0.0.0.0
OLLAMA_PORT=11434
```

## Local Development

To run the entire stack locally:

```bash
# Clone the repository
git clone https://github.com/yourusername/railway-n8n-supabase-ollama.git
cd railway-n8n-supabase-ollama

# Create a .env file with required variables
cp .env.example .env
# Edit the .env file with your settings

# Start all services
docker-compose up -d
```

## Deployment Instructions

### 1. Prepare Your Repository

```bash
git clone <your-repo-url>
cd railway-n8n-supabase-ollama
```

### 2. Deploy to Railway

1. **Connect Repository**: Link your GitHub repo to Railway
2. **Configure Services**: Set up each service with proper environment variables
3. **Deploy**: Railway will automatically build and deploy each service

### 3. Post-Deployment Setup

#### n8n Setup:
1. Access your n8n instance at `https://your-n8n-domain.railway.app`
2. Complete the initial setup wizard
3. Configure database connection using Railway's Postgres addon

#### Supabase Setup:
1. Access Supabase Studio at `https://your-supabase-domain.railway.app`
2. Set up your database schema
3. Configure authentication providers

#### Ollama Setup:
1. Access Ollama at `https://your-ollama-domain.railway.app`
2. Pull models via API:
   ```bash
   curl -X POST https://your-ollama-domain.railway.app/api/pull \
     -d '{"name": "llama2"}'
   ```

## Integration Examples

### n8n + Supabase
- Create workflows that read/write to Supabase
- Use Supabase Auth for user management
- Trigger workflows on database changes

### n8n + Ollama
- Process text with local LLMs
- Create AI-powered workflows
- Generate content without external API dependencies

### Supabase + Ollama
- Store LLM responses in Supabase
- Create AI chat applications
- Process uploaded documents with AI

## Resource Considerations

### Memory Requirements:
- **n8n**: 512MB - 1GB
- **Supabase**: 2GB - 4GB
- **Ollama**: 4GB - 8GB (depending on models)

### Storage:
- **n8n**: Minimal (uses external DB)
- **Supabase**: 1GB - 10GB (database storage)
- **Ollama**: 5GB - 50GB (model storage)

## Troubleshooting

### Common Issues:

1. **Service startup failures**
   - Check environment variables
   - Verify port configurations
   - Review Railway logs

2. **Database connection issues**
   - Ensure Postgres service is running
   - Verify connection strings
   - Check firewall rules

3. **Ollama model loading**
   - Increase memory allocation
   - Check available disk space
   - Verify model compatibility

## Security Notes

- Use strong passwords for all services
- Enable HTTPS only
- Configure proper CORS settings
- Use Railway's private networking when possible
- Regularly update service images

## License

MIT License

## Support

- Railway Documentation: https://docs.railway.app
- n8n Documentation: https://docs.n8n.io
- Supabase Documentation: https://supabase.com/docs
- Ollama Documentation: https://ollama.ai/docs
