locals {
  common_tags=merge(
    {
        environment="dev"
        managed_by="terraform"
    },
    var.tags
  )
}