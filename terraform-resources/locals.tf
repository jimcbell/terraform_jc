locals {
    resource_group_name = "MGT-E1-RG"
    tf_state = {
        storage_account_name = "mgte1tfstate"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}