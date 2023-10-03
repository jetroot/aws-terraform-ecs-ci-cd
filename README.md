# React + CI/CD + AWS ECS + Terraform

Creating a react app and automate the process of deployment from provisioning the infrastructure with IaC using Terraform to deploying it to AWS ECS (Elastic Container Service) with Github Action using CI/CD Continuous Integration and Continuous Delivery.

Used technologies:

- React with vite
- CI/CD with Github Action
- IaC with Terraform
- AWS ECS 

## Install

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

1. Enter terraform directory `cd terraform` 
2. Run command like this:

```bash
   terraform apply --auto-approve
```

3. Create your own github repo
4. Create `secrets variables` in your guthub repo
5. Go to `aws ecs task definition` and get json task definition
6. Go to `.github/workflows/task_definition.json` and paste that task definition json there.

# Deploy
Push your code changes to github