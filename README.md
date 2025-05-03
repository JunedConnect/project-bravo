# Weather API App Deployment

This project automates the deployment of the **Weather API App** using **AWS**, **Terraform**, **Docker**, and **CI/CD pipelines**. Originally set up manually using **AWS Console**, the process has been automated to provide a secure, scalable, and streamlined deployment.

<br>

## Overview

The **Weather API App** is a containerised Node.js application deployed on **AWS EKS** using **Helm** and **Argo CD**. The deployment process is fully automated using a **CI/CD pipeline** that handles Docker image building, vulnerability scanning, and deployment to AWS through **Terraform**.

<br>

This setup uses:


- **Cert Manager** to automate the issuance and renewal of TLS certificates

- **External DNS** to dynamically manage Route 53 records based on Kubernetes ingress resources, eliminating manual DNS configuration.

- **Argo CD** for GitOps-based deployments, ensuring the cluster always reflects the state defined in the Git repository.

- **Prometheus & Grafana** to collect cluster metrics and provide dashboards for visualising cluster metrics in real time.

<br>

## Architecture Diagram

![AD](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/Architecture%20Diagram.png)

<br>

## Key Components:

- **Dockerisation**: The app is containerised using a **Dockerfile**, utilising multi-stage builds.
- **Infrastructure as Code (IaC)**: Terraform provisions the following AWS resources:
    - **VPC, Subnets, NAT Gateway, and Security Groups** for network architecture.
    - **Route 53** for DNS management.
    - **Amazon EKS** for managing Kubernetes cluster.
    - **IAM Roles for Service Accounts (IRSA)** to securely allow Kubernetes service accounts to assume AWS IAM roles.
    - **Helm Charts** to deploy Argo CD, NGINX Ingress, Cert Manager, External DNS, Prometheus & Grafana.
- **CI/CD Pipeline**: GitHub Actions automate:
    - Building and pushing the Docker image to **Amazon ECR.
    - Performing security and compliance scans to ensure code quality and security.
    - Applying Terraform to deploy or update AWS infrastructure.
    - Deploying Kubernetes manifests and Helm charts.
    - Destroying Terraform resources when necessary.

<br>

## Directory Structure

```
./
├── app
│   └── Dockerfile
├── terraform
│   ├── helm-values
│   │   ├── argo-cd.yml
│   │   ├── cert-manager.yml
│   │   ├── external-dns.yml
│   │   └── prom-graf.yml
│   ├── modules
│   │   ├── eks
│   │   ├── helm
│   │   ├── irsa
│   │   ├── route53
│   │   └── vpc
│   ├── main.tf
│   ├── provider.tf
│   └── variables.tf
└── .github
   └── workflows
       ├── DockerBuild&Deploy.yml
       ├── TerraformPlan.yml
       ├── TerraformApply.yml
       └── TerraformDestroy.yml
```

- **Docker File** (`app/`):
    - **Dockerfile**: Builds and configures the Node.js app for container deployment.

- **Argo CD Configs** (`argocd/`):
    - **apps/app.yml**: Defines Kubernetes application deployment, service, and ingress resources.
    - **argocd-git.yml**: Configures Argo CD to manage the app using GitOps.

- **Certificate Management** (`cert-man/`):
    - **issuer.yml**: Sets up a ClusterIssuer using Let's Encrypt for TLS certificates.

- **Terraform Files** (`terraform/`):
    - **helm-values**: Contains Helm values for Argo CD, Cert Manager, External DNS, Prometheus & Grafana.
    - **modules/eks**: Creates the EKS cluster and node groups.
    - **modules/helm**: Installs core Kubernetes tools via Helm.
    - **modules/irsa**: Sets up IRSA for Kubernetes resources to access to AWS services.
    - **modules/route53**: Manages DNS hosted zone.
    - **modules/vpc**: Provisions the full VPC setup.
    - **main.tf**: Defines the AWS infrastructure using Terraform modules.
    - **provider.tf**: Configures AWS, Kubernetes, and Helm providers.
    - **variables.tf**: Stores all Terraform variables.

- **CI/CD Pipelines** (`.github/workflows/`):

<br>


## CI/CD Deployment Workflow

The deployment process is fully automated via GitHub Actions:

1. **Docker Image Build & Deployment** (`DockerBuild&Deploy.yml`):
    - Builds the Docker image.
    - Runs **Trivy** to scan for critical vulnerabilities before pushing to ECR.
    - Pushes the image to **Amazon ECR**.

2. **Terraform Plan** (`TerraformPlan.yml`):
    - Initialises the Terraform directory.
    - Previews the necessary AWS resources.
    - Runs **TFLint** to validate Terraform syntax and best practices.
    - Runs **Checkov** to scan for security issues within Terraform code.

3. **Terraform Apply** (`TerraformApply.yml`):
    - Applies the Terraform configuration.
    - Provisions the necessary AWS resources
    - Deploys Argo CD configuration for app deployment, and cert-manager issuer.

4. **Terraform Destroy** (`TerraformDestroy.yml`):
    - Destroys all AWS resources provisioned by Terraform.

<br>

To trigger any of these workflows, navigate to **GitHub Actions** and manually run the relevant workflow.

<br>

|Here’s what it will look like:|
|-------|
|Application Page:|
| ![App](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/App%20Page.png) |
|SSL Certificate:|
| ![SSL](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/SSL%20Certificate.png) |
|Argo CD:|
| ![ArgoCD](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/ArgoCD%20Page.png) |
|Prometheus:|
| ![Prometheus](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/Prometheus%20Page.png) |
|Grafana Dashboard:|
| ![Grafana](https://raw.githubusercontent.com/JunedConnect/project-bravo/main/images/Grafana%20Dashboard.png) |
