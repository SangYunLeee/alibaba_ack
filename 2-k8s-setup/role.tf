resource "alicloud_ram_role" "cs_ai_assistant" {
  name        = "AliyunCSAIAssistantRole"
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
