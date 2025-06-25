# Vault/OpenBao setup for [GatePlane Okta Group Gate Plugin](https://github.com/gateplane-io/vault-plugins/tree/main/cmd/okta-group-gate)
![License: ElasticV2](https://img.shields.io/badge/ElasticV2-green?style=flat-square&label=license&cacheSeconds=3600&link=https%3A%2F%2Fwww.elastic.co%2Flicensing%2Felastic-license)

This Terraform module mounts the Okta Group Gate Plugin under a Vault/OpenBao path.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2.4 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 4.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.4 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [null_resource.reconfigure](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [vault_auth_backend.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.plugin_config](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.plugin_config_okta_api](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_policy.gtkpr](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the gate, used in the mount path | `any` | n/a | yes |
| <a name="input_okta_api"></a> [okta\_api](#input\_okta\_api) | The credentials to connect to the Okta API. (Currently only [`SSWS`](https://developer.okta.com/docs/guides/create-an-api-token/main/#okta-api-tokens) authentication is supported, with [`GROUP_MEMBERSHIP_ADMIN`](https://developer.okta.com/docs/api/openapi/okta-management/guides/roles/#standard-roles)) | <pre>object({<br/>    org_url = string<br/>    api_token   = string<br/>  })</pre> | n/a | yes |
| <a name="input_okta_group_id"></a> [okta\_group\_id](#input\_okta\_group\_id) | The Okta Group where the users will be temporarily added to (e.g: `00g5j4jojlGZMzfhM697`) . | `string` | n/a | yes |
| <a name="input_okta_mount_accessor"></a> [okta\_mount\_accessor](#input\_okta\_mount\_accessor) | The mount accessor of the Vault/Openbao Auth Backend that authenticates entities through Okta. (Currently only OIDC Auth Method configured with Okta App is supported) | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Brief explanation of what access is claimed by this gate | `string` | `""` | no |
| <a name="input_enable_ui"></a> [enable\_ui](#input\_enable\_ui) | Add capabilities for GatePlane UI to the created policies. | `bool` | `true` | no |
| <a name="input_endpoint_prefix"></a> [endpoint\_prefix](#input\_endpoint\_prefix) | n/a | `string` | `"gp"` | no |
| <a name="input_lease_ttl"></a> [lease\_ttl](#input\_lease\_ttl) | The duration that the Okta User will remain in the Okta Group (e.g.: `1h`). | `string` | `"30m"` | no |
| <a name="input_okta_entity_key"></a> [okta\_entity\_key](#input\_okta\_entity\_key) | n/a | `string` | `"user"` | no |
| <a name="input_path_prefix"></a> [path\_prefix](#input\_path\_prefix) | Where under `auth/` will the endpoint be mounted | `string` | `"gateplane"` | no |
| <a name="input_plugin_name"></a> [plugin\_name](#input\_plugin\_name) | n/a | `string` | `"gateplane-okta-group-gate"` | no |
| <a name="input_plugin_options"></a> [plugin\_options](#input\_plugin\_options) | Options provided by the plugin, available [in plugin documentation](https://github.com/gateplane-io/vault-plugins). | `map` | `{}` | no |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | n/a | `string` | `"gateplane"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mount_path"></a> [mount\_path](#output\_mount\_path) | The Vault/OpenBao path where the plugin has been mounted. |
| <a name="output_policy_names"></a> [policy\_names](#output\_policy\_names) | The names of the policies created and referenced in this module. |


## License

This project is licensed under the [Elastic License v2](https://www.elastic.co/licensing/elastic-license).

This means:

- ✅ You can use, fork, and modify it for **yourself** or **within your company**.
- ✅ You can submit pull requests and redistribute modified versions (with the license attached).
- ❌ You may **not** sell it, offer it as a paid product, or use it in a hosted service (e.g., SaaS).
- ❌ You may **not** re-license it under a different license.

In short: You can use and extend the code freely, privately or inside your business - just don’t build a business around it without our permission.
[This FAQ by Elastic](https://www.elastic.co/licensing/elastic-license/faq) greatly summarizes things.

See the [`./LICENSES/Elastic-2.0.txt`](./LICENSES/Elastic-2.0.txt) file for full details.
