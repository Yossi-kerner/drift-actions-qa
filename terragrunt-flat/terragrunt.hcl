# No `terraform { source = ... }` block on purpose: terragrunt runs terraform in place,
# so .terraform.lock.hcl lands in the working dir and env0 records a flat providerVersions map.
