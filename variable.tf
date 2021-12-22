
variable "cred-name" {
    type = string
    default = "mylearning-331213-21e283592fa8.json"
}

variable "region" {
    type = string
    default = "asia-south1"
}
variable "project" {
    type = string
 default = "mylearning-331213"
}
variable "zone" {
    type = string
    default = "asia-south1-a"
}

variable "ip_cidr_range" {
    type = string
    default = "192.168.0.0/20"
}

variable "auto_create_subnetworks" {
    type = bool
    default = false
}

variable "network-name" {
    type = string
    default = "terra-network"
}
variable "subnet-name" {
    type = string
    default = "terra-subnetwork"
}
variable "fire-name" {
    type = string
    default = "terra-firewall"
}
variable "protocol" {
    type = list(string)
    default = ["icmp" , "tcp"]
}
variable "ports" {
    type = list(string)
    default = ["22" , "80"]
}

variable "source-tags" {
    type = string
    default = "web"
}

variable "vm-name " {
    type = string
    default = "terraforminstance1"
}
variable "machine-type" {
    type = string
    default = "e2-medium"
}
