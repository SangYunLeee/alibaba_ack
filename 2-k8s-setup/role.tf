resource "alicloud_ram_role" "cs_ai_assistant" {
  name        = "AliyunCSAIAssistantRoleTF"
  document    = <<EOF
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOF
  description = "ACK AI Assistant Role"
}

resource "alicloud_ram_role_policy_attachment" "cs_ai_assistant_policy" {
  policy_name = "AliyunCSAIAssistantRolePolicy"
  policy_type = "System"
  role_name   = alicloud_ram_role.cs_ai_assistant.name
}
