# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

variable "plugin_name" {
  default = "gateplane-okta-group-gate"
}

variable "okta_group_id" {
  description = "The Okta Group where the users will be temporarily added to (e.g: `00g5j4jojlGZMzfhM697`) ."
  type        = string
}

variable "okta_entity_key" {
  type    = string
  default = "user"
}

variable "okta_api" {
  description = "The credentials to connect to the Okta API. (Currently only [`SSWS`](https://developer.okta.com/docs/guides/create-an-api-token/main/#okta-api-tokens) authentication is supported, with [`GROUP_MEMBERSHIP_ADMIN`](https://developer.okta.com/docs/api/openapi/okta-management/guides/roles/#standard-roles))"
  type = object({
    org_url   = string
    api_token = string
  })
}

variable "okta_mount_accessor" {
  description = "The mount accessor of the Vault/Openbao Auth Backend that authenticates entities through Okta. (Currently only OIDC Auth Method configured with Okta App is supported)"
  type        = string
}


// Required by Base Plugin

variable "name" {
  description = "Name of the gate, used in the mount path and generated policies."
}

variable "description" {
  description = "Brief explanation of what access is requested through this gate."
  default     = ""
}

variable "policy_prefix" {
  default = "gateplane"
}

variable "endpoint_prefix" {
  default = "gp"
}

variable "path_prefix" {
  description = "The endpoint where the plugin will be mounted."
  default     = "gateplane"
}

variable "lease_ttl" {
  description = "The duration that the protected token will be active (e.g.: \"`1h`\")."
  default     = "30m"
}

variable "lease_max_ttl" {
  description = "The duration that the protected token will be active (e.g.: \"`1h`\")."
  default     = "1h"
}

variable "plugin_options" {
  description = "Base options provided by the plugin to the `/config` endpoint, available [in plugin documentation](https://github.com/gateplane-io/vault-plugins)."
  default     = {}
}
