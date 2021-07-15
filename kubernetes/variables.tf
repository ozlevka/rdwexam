variable "general" {
  type        = object({
      project_name = string
  })
  default     = {
      project_name = "radware"
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

