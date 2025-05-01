module "eks" {
    source = "./modules/eks"

  public-subnet-1-id                          = module.vpc.public-subnet-1-id
  public-subnet-2-id                          = module.vpc.public-subnet-2-id
  private-subnet-1-id                         = module.vpc.private-subnet-1-id
  private-subnet-2-id                         = module.vpc.private-subnet-2-id

  name                                        = var.name
  authentication-mode                         = var.authentication-mode
  bootstrap-cluster-creator-admin-permissions = var.bootstrap-cluster-creator-admin-permissions
  cluster-version                             = var.cluster-version
  endpoint-private-access                     = var.endpoint-private-access
  endpoint-public-access                      = var.endpoint-public-access
  upgrade_support_type                        = var.upgrade_support_type

  node-group-name                             = var.node-group-name
  desired-size                                = var.desired-size
  max-size                                    = var.max-size
  min-size                                    = var.min-size
  instance-disk-size                          = var.instance-disk-size
  instance-types                              = var.instance-types
  capacity-type                               = var.capacity-type

  eks-cluster-role-name                       = var.eks-cluster-role-name
  eks-node-group-role-name                    = var.eks-node-group-role-name

}

module "helm" {
    source = "./modules/helm"

  cert-manager-irsa-role-arn          = module.irsa.cert-manager-irsa-role-arn
  external-dns-irsa-role-arn          = module.irsa.external-dns-irsa-role-arn

  cert-manager-helm-name              = var.cert-manager-helm-name
  cert-manager-helm-values-file-path  = var.cert-manager-helm-values-file-path
  cert-manager-namespace              = var.cert-manager-namespace

  external-dns-helm-name              = var.external-dns-helm-name
  external-dns-helm-values-file-path  = var.external-dns-helm-values-file-path
  external-dns-namespace              = var.external-dns-namespace

  nginx-ingress-helm-name             = var.nginx-ingress-helm-name
  nginx-ingress-namespace             = var.nginx-ingress-namespace

  argocd-helm-name                    = var.argocd-helm-name
  argocd-helm-values-file-path        = var.argocd-helm-values-file-path
  argocd-namespace                    = var.argocd-namespace

  prom-graf-helm-name                 = var.prom-graf-helm-name
  prom-graf-helm-values-file-path     = var.prom-graf-helm-values-file-path
  prom-graf-namespace                 = var.prom-graf-namespace

}

module "irsa" {
    source = "./modules/irsa"

  route53-zone-id        = module.route53.route53-zone-id
  oidc-issuer-url        = module.eks.oidc-issuer-url

  cert-manager-namespace = var.cert-manager-namespace
  external-dns-namespace = var.external-dns-namespace

}

module "route53" {
    source = "./modules/route53"

  domain_name = var.domain_name

}

module "vpc" {
    source = "./modules/vpc"

  name                            = var.name
  vpc-cidr-block                  = var.vpc-cidr-block
  publicsubnet1-cidr-block        = var.publicsubnet1-cidr-block
  publicsubnet2-cidr-block        = var.publicsubnet2-cidr-block
  privatesubnet1-cidr-block       = var.privatesubnet1-cidr-block
  privatesubnet2-cidr-block       = var.privatesubnet2-cidr-block
  enable-dns-support              = var.enable-dns-support
  enable-dns-hostnames            = var.enable-dns-hostnames
  subnet-map-public-ip-on-launch  = var.subnet-map-public-ip-on-launch
  availability-zone-1             = var.availability-zone-1
  availability-zone-2             = var.availability-zone-2
  route-cidr-block                = var.route-cidr-block

}