# Lambda e Api Gateway
Projeto do curso de pós graduação da FIAP


## Requisitos para deploy
- Cluster EKS em produção
- Cognito em produção


## Secrets

Secrets cadastradas no repositório do GitHub

```bash
TF_VAR_ROLE_ARN
TF_VAR_COGNITO_CLIENT_ID
TF_VAR_COGNITO_USER_POOL_ID
AWS_REGION
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
GCP_SA_KEY
```

## Authentication
A autenticação é feita pelo headers

```bash
authentication = true/false
cpf (só será autenticado se existir valor)
email (dados adicionais)
name (dados adicionais)
```