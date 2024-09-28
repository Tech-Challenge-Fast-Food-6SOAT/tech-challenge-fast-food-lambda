variable "clientId" {
  type        = string
  description = "The ID of the Cognito User Pool Client"
}

variable "userPoolId" {
  type        = string
  description = "The ID of the Cognito User Pool"
}

variable "role_arn" {
  type        = string
  description = "The ARN of the IAM Role"
}
