variable "general" {
  type        = object({
      project_name       = string
      node_instance_type = string 
  })
  default     = {
      project_name       = "radware"
      node_instance_type = "r5n.xlarge"
  }
  description = "general used variables"
}

variable "sg_ingress_networks" {
   type = list(object({
      from_port   = number
      to_port     = number
      cidr_blocks  = list(string)
      description = string
      protocol    = string
   }))
   default       = [
     {
           from_port   = 22,
           to_port     = 22,
           cidr_blocks  = ["84.229.91.54/32"]
           protocol    = "tcp"
           description = "Just from WFH"
      }]
   description   = "List of ingress networks definitions for default security group" 
}

variable "users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::013470295104:user/takehome.eu-central-1"
      username = "master.man"
      groups   = ["system:masters"]
    }
  ]
}

