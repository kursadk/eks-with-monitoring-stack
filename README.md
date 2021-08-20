# About
In this repo, you can provision a kubernetes cluster in EKS which has nginx ingress controller, vault and  prometheus-stack.
-  Prometheus comes with a predefined alert to notify an endpoint you want yo trigger incase a container memory usage is greater than 10%.
-  By default a trivial endpoint (i.e https://kursadk.requestcatcher.com/alert_events ) is triggered. It can be changed in file "prometheus-values.yml"
-  AlertManager is protected by username and password thanks to Nginx Ingress 

## How to use
- Following tools are required; [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli), [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/), [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
-  Clone the repo and configure aws client
    -     $ git clone https://github.com/kursadk/eks-with-monitoring-stack.git
          $ aws configure
              AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID 
              AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY 
              Default region name [None]: YOUR_AWS_REGION 
              Default output format [None]: json
 - Modify input parameters and run terraform
    -     $ vi terraform.tfvars
          $ terraform init
          $ terraform apply # It will take approximately 10mins to provision
- Configure kubectl
  -     $ aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)       
 - Get LoadBalancer URL created for nginx ingress controller
   -     $ kubectl get svc ingress-nginx-controller -o jsonpath={.status.loadBalancer.ingress[0].hostname}

Now  you can access prometheus and alertmanager from `<Load-balancer-URL>/` and ` <Load-balancer-URL>/alertmanager` respectively
>**Note:** Both paths are secured with username and password that you provide in `terraform.tfvars`


## Things to be improved
- There might be some broken links in alert-manager which redirects user to default base URL instead of the `<Load Balancer URL>` that user comes with. It can be done by setting `externalURL/baseURL` in prometheus-values.yml file
- Vault is installed but not used yet. But it is possible to develop a simple authentication application to be used as external authentication endpoint in Nginx as  shown below. So Nginx can store username and password on Vault.
 
![alt text](https://github.com/kursadk/eks-with-monitoring-stack/raw/master/vault-diagram.png)


 >**Note:** This is not implemented in this repo. Put here to show it's possible to enable authentication on AlertManager by storing credentials in vault
