### Create resources
az group create --name tf_rg_imovila --location canadaeast
az group create --name tf_rg_blobstore --location canadaeast
az storage account create --name tfstorageimovilaapi --resource-group tf_rg_blobstore --location canadaeast --sku Standard_LRS

### GET key
az storage account keys list --resource-group tf_rg_blobstore --account-name tfstorageimovilaapi --query "[0].value" --output tsv

### Create container
az storage container create --name tfstate --account-name tfstorageimovilaapi --account-key <key value>
