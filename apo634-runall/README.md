APO-634 A6 fixture. Terragrunt run-all with NO `terraform { source = ... }`, so each unit
runs in place and its terraform.tfstate survives env0's state upload — files under
.terragrunt-cache are rejected by services/deployment-service/commons/state.ts.
Both units instantiate the same module twice, so `module.edge.null_resource.gateway` and
`module.core.null_resource.gateway` appear once per unit. Bump `gen` to force a recreate.
