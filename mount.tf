# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

resource "vault_generic_endpoint" "plugin_config_access" {
  depends_on = [module.base, vault_generic_endpoint.plugin_config_okta]

  path                 = local.plugin_paths["access"]
  disable_read         = false
  disable_delete       = true
  ignore_absent_fields = true

  data_json = jsonencode({
    "okta_group_id" = var.okta_group_id
  })

  lifecycle {
    replace_triggered_by = [null_resource.reconfigure]
  }
}

resource "vault_generic_endpoint" "plugin_config_okta" {
  depends_on = [module.base]

  path                 = local.plugin_paths["okta"]
  disable_read         = true
  disable_delete       = true
  ignore_absent_fields = true

  data_json = jsonencode(
    {
      "okta_entity_key"     = var.okta_entity_key,
      "org_url"             = var.okta_api.org_url,
      "api_token"           = var.okta_api.api_token,
      "auth_mount_accessor" = var.okta_mount_accessor,
    }
  )

  lifecycle {
    replace_triggered_by = [null_resource.reconfigure]
  }
}

resource "null_resource" "reconfigure" {
  triggers = {
    always_recreate = timestamp()
  }
}
