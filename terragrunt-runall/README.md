Terragrunt `run-all` fixture for APO-633 (plan panels keyed per module).

Two units, `stage/vpc` and `stage/app`, both source `modules/stack`, so the same
resource addresses repeat across modules:

| module | addresses | output |
| -- | -- | -- |
| `stage/vpc` | `module.core.null_resource.gateway`, `module.edge.null_resource.gateway` | `vpc_id = vpc-stage/vpc` |
| `stage/app` | `module.core.null_resource.gateway`, `module.edge.null_resource.gateway` | `vpc_id = vpc-stage/app` |

No dependency between the units, so `run-all plan` never hits the documented
plan-apply mismatch. State is local — the plan is what this fixture is for, not
the apply.
