variable "AWS_REGION" {    
    default = "eu-west-2"
    type = string
}


variable "images" {
  type = map

  default = {
    us-east-1 = "image-1234"
    us-west-2 = "image-4567"
  }
}


variable "AMI" {
    type = "map"
    
    default = {
        eu-west-2 = "ami-03dea29b0216a1e03"
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}
