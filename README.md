# ONPK

## semester work

### Basic folder structure

- .github/workflow - defined github actions (docker image build and push to dockerhub)
- appbackend - dockerfile and src files for creating image for appbackend
- appfrontend - dockerfile and src files for creating image for appfrontend
- terraform folder - provisioning for OpenStack private cloud with usage of IaaC tool Terraform
- helm - folder used for maintaining the helm charts

### terraform

Terraform used as a tool for provisioning infrastructure as a code.

Terraform state is saved using hashicorp cloud (only as a storage).

based on Daniel's repository:
https://github.com/drajcan-nephthys/kis-onpk.git

### Docker images

https://hub.docker.com/repository/docker/crackiesvk/appfrontend
https://hub.docker.com/repository/docker/crackiesvk/appbackend

### helm

resources for helm deployment

- appfrontend - running docker image crackiesvk/appfrontend
- appbackend - running docker image crackiesvk/appbackend + mongoDB by bitnami

### workflows

defines actions and it's pipelines for build or test

- appbackend - on push to appbackend folder the code is builded and pushed to dockerhub crackiesvk/appbackend with latest tag
- appfrontend - aon push to appbackend folder the code is builded and pushed to dockerhub crackiesvk/appfrontend with latest tag
- terraform_check - on push to terraform folder the code is checked to be in correct format
- terraform_deploy - on manual action, terraform apply will be used to change remote server configuration (vpc install, docker, minikube, helm install)
