# GitHub Actions Class

## Deploying code to EC2 instance with GitHub Actions

```
Repository -
           | - app-code
           | - terraform-code
           | - .github/workflows/deploy-to-ec2.yaml
```

### GitHub Actions Pipeline

- It uses 4 Environment Secrets to deploy to EC2 machine

```
  EC2_SSH_KEY
  HOST_DNS
  USERNAME
  TARGET_DIR
```
