tofu init -upgrade
tofu plan -out main.tfplan
tofu apply main.tfplan
resource_group_name=$(terraform output -raw resource_group_name)
az group show --name $resource_group_name
tofu plan -destroy -out main.destroy.tfplan
tofu apply main.destroy.tfplan

aztfexport resource-group myResourceGroup
aztfexport resource-group --non-interactive --hcl-only myResourceGroup