# RADWARE Exam

## To Do

* Create terraform flow EKS cluster
    * Create VPC from official VPC module
    * Create EKS cluster and node group from official module

* Dockerize given applicatin 

* Make helm chart for deploy application.

## Working environment
The working environment built with [VSCode IDE](https://code.visualstudio.com/). By using [Remote development plugin](https://code.visualstudio.com/docs/remote/remote-overview). The configuration in .devcontainer directory contains Docker file with all installations and tools for working with this project.

* For achieve ready to use environment just follow after [instructions](https://code.visualstudio.com/docs/remote/containers).

## Terraform flow HoTo.

For run terraform flow you need:

1. AWS access file: Default location in $HOME/.aws
    * [Geneterate accesskey](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html?icmpid=docs_iam_console) 
    * [Run aws configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
2. Run 
```
terraform apply
```
3. [update kubeconfig](https://docs.aws.amazon.com/cli/latest/reference/eks/update-kubeconfig.html).

Validate that you able access to EKS cluster by your favorite Kubernetes program.

## Application installation

1. From root of workspace into dev container run: 
```
helm upgrade --install sample-application ./sample-application --namespace default
```
2. For get loadbalance URI run in workspace root of dev container:
```
kubectl get service sample-application -o wide
```

Working enfpoint avaliable on http://```load balancer uri```:5000/api/swagger
    