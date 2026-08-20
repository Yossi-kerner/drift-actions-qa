# drift-actions-qa

Seed templates for env0 Drift Actions QA (ENG-2258). Each folder is an env0
template path; the commit history is deliberate — environments are deployed
pinned to the baseline commit and drift-scanned at head.

| Path | Seeds | Drift mechanism |
| -- | -- | -- |
| `null-resource` | S1 `variableChange` (+ sensitive-var B7) | flip `drift_trigger` / `secret_trigger` env0 variable without deploying |
| `unapplied` | S2 `unappliedCommit` | deploy pinned to the baseline commit; a later commit changes `triggers.rev` |
| `pinned-provider` | S3 `providerVersionChange` | later commit bumps null provider 3.2.1 → 3.2.3 and `triggers.rev` (the trigger change makes the scan actually drift) |
| `pinned-module` | S3 `moduleVersionChange` | later commit bumps cloudposse/label/null 0.24.1 → 0.25.0 and `triggers.rev` |
| `aws-drift` | S4 `unmanagedChange` | 3 addressable SSM parameters (2 top-level + 1 in `module.nested`); mutate value/tags out-of-band with the AWS CLI |
| `workflow` | A9/A12 workflow parent | children reference org templates `qa-drift-child-a` / `qa-drift-child-b` (both point at `null-resource`) |

A drift scan only records causes when the plan actually drifts, so every
"version change" commit also changes a `null_resource` trigger in the same
folder.

# apo603 qa branch base
