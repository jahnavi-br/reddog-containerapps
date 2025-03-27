# *nix only
export RG="reddog-02" #make sure this to have a unique name
export LOCATION="eastus2"
export SUB_ID="353805d9-c601-42f7-a5a7-6d03ec33642a"


# Follow Azure CLI prompts to authenticate to your subscription of choice
az login
az account set --subscription $SUB_ID

# Create resource group
az group create -n $RG -l $LOCATION

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g $RG -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g $RG -o json --query properties.outputs.urls.value
