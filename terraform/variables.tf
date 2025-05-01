#General

variable "name" {
  description = "Resource Name"
  type        = string
  default     = "test"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "eu-west-2"
}

variable "tags" {
  description = "Tags for Resources"
  type        = map(string)
  default = {
    Environment = "dev",
    Project     = "eks",
    Owner       = "juned",
    Terraform   = "true"
  }
}


#eks

variable "authentication-mode" {
  description = "The authentication mode for the EKS cluster"
  type        = string
  default     = "API"
}

variable "bootstrap-cluster-creator-admin-permissions" {
  description = "Whether to grant bootstrap cluster creator admin permissions"
  type        = bool
  default     = true
}

variable "cluster-version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.31"
}

variable "endpoint-private-access" {
  description = "Whether the EKS cluster API server is reachable from private endpoints"
  type        = bool
  default     = true
}

variable "endpoint-public-access" {
  description = "Whether the EKS cluster API server is reachable from public endpoints"
  type        = bool
  default     = true
}

variable "upgrade_support_type" {
  description = "The support type for the upgrade policy."
  type        = string
  default     = "STANDARD"
}

variable "node-group-name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "eks-node-group"
}

variable "desired-size" {
  description = "Desired number of nodes"
  type        = number
  default     = 1
}

variable "max-size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 2
}

variable "min-size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "instance-disk-size" {
  description = "Disk size for instances"
  type        = number
  default     = 50
}

variable "instance-types" {
  description = "List of instance types to be used within the cluster"
  type        = list(string)
  default     = ["t3.large"]
}

variable "capacity-type" {
  description = "Type of capacity for the EKS node group"
  type        = string
  default     = "ON_DEMAND"
}

variable "eks-cluster-role-name" {
  description = "Name of the EKS cluster role"
  type        = string
  default     = "eks-cluster-role"
}

variable "eks-node-group-role-name" {
  description = "Name of the EKS node group role"
  type        = string
  default     = "eks-node-group-role"
}


#helm

variable "cert-manager-helm-name" {
  description = "The name of the Helm release for cert-manager"
  type        = string
  default     = "cert-manager"
}

variable "cert-manager-helm-values-file-path" {
  description = "The file path to the cert-manager Helm values"
  type        = string
  default     = "helm-values/cert-manager.yml"
}

variable "cert-manager-namespace" {
  description = "The namespace for cert-manager"
  type        = string
  default     = "cert-manager"
}

variable "external-dns-helm-name" {
  description = "The name of the Helm release for external-dns"
  type        = string
  default     = "external-dns"
}

variable "external-dns-helm-values-file-path" {
  description = "The file path to the external-dns Helm values"
  type        = string
  default     = "helm-values/external-dns.yml"
}

variable "external-dns-namespace" {
  description = "The namespace for external-dns"
  type        = string
  default     = "external-dns"
}

variable "nginx-ingress-helm-name" {
  description = "The name of the Helm release for nginx-ingress"
  type        = string
  default     = "nginx-ingress"
}

variable "nginx-ingress-namespace" {
  description = "The namespace for nginx-ingress"
  type        = string
  default     = "nginx-ingress"
}

variable "argocd-helm-name" {
  description = "The name of the Helm release for argocd"
  type        = string
  default     = "argocd"
}

variable "argocd-helm-values-file-path" {
  description = "The file path to the argocd Helm values"
  type        = string
  default     = "helm-values/argo-cd.yml"
}

variable "argocd-namespace" {
  description = "The namespace for nginx-ingress"
  type        = string
  default     = "argocd"
}

variable "prom-graf-helm-name" {
  description = "The name of the Helm release for argocd"
  type        = string
  default     = "prom-graf"
}

variable "prom-graf-helm-values-file-path" {
  description = "The file path to the prom-graf Helm values"
  type        = string
  default     = "helm-values/prom-graf.yml"
}

variable "prom-graf-namespace" {
  description = "The namespace for prom-graf"
  type        = string
  default     = "monitor"
}


#irsa


#route53

variable "domain_name" {
  description = "The domain name for the Route53 hosted zone"
  type        = string
  default     = "lab.juned.co.uk"
}


#vpc

variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "publicsubnet1-cidr-block" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "publicsubnet2-cidr-block" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "privatesubnet1-cidr-block" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "privatesubnet2-cidr-block" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "enable-dns-support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable-dns-hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "subnet-map-public-ip-on-launch" {
  description = "Whether to map public IP on launch for subnets"
  type        = bool
  default     = true
}

variable "availability-zone-1" {
  description = "Availability zone 1"
  type        = string
  default     = "eu-west-2a"
}

variable "availability-zone-2" {
  description = "Availability zone 2"
  type        = string
  default     = "eu-west-2b"
}

variable "route-cidr-block" {
  description = "CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}