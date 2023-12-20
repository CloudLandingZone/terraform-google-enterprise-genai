/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "folder_id" {
  description = "folder id of the business unit"
  type        = string
}
variable "project_suffix" {
  description = "project suffix"
  type        = string
}

variable "application_name" {
  description = "name of application"
  type        = string
}

variable "business_code" {
  description = "business code"
  type        = string
}

variable "activate_apis" {
  description = "API's to activate for this project"
  type        = list(string)
}
variable "repo_name" {
  description = "name of repo to create"
  type        = string
}

variable "env" {
  description = "The environment this deployment belongs to (ie. development)"
  type        = string
}
variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "remote_state_bucket" {
  description = "Backend bucket to load Terraform Remote State Data from previous steps."
  type        = string
}

variable "location_kms" {
  description = "Case-Sensitive Location for KMS Keyring (Should be same region as the GCS Bucket)"
  type        = string
  default     = "us"
}

variable "location_gcs" {
  description = "Case-Sensitive Location for GCS Bucket (Should be same region as the KMS Keyring)"
  type        = string
  default     = "US"
}

variable "tfc_org_name" {
  description = "Name of the TFC organization."
  type        = string
  default     = ""
}

variable "project_budget" {
  description = <<EOT
  Budget configuration.
  budget_amount: The amount to use as the budget.
  alert_spent_percents: A list of percentages of the budget to alert on when threshold is exceeded.
  alert_pubsub_topic: The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}`.
  alert_spend_basis: The type of basis used to determine if spend has passed the threshold. Possible choices are `CURRENT_SPEND` or `FORECASTED_SPEND` (default).
  EOT
  type = object({
    budget_amount        = optional(number, 1000)
    alert_spent_percents = optional(list(number), [1.2])
    alert_pubsub_topic   = optional(string, null)
    alert_spend_basis    = optional(string, "FORECASTED_SPEND")
  })
  default = {}
}

variable "key_rotation_period" {
  description = "Rotation period in seconds to be used for KMS Key"
  type        = string
  default     = "7776000s"
}

