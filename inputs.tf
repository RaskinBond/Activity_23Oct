variable "network_cidrs" {
    type    = list(string)
    default = [ "192.168.0.0/16", "10.168.0.0/16" ]
}

variable "subnet_tags" {
    type    = list(string)
    default = [ "app", "cache", "db", "web" ]
}

# terraform graph usage
# terraform graph -type=plan > plan.dot