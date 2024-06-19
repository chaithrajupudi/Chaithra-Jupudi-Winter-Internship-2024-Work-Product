projectInfo = {
    project = ""
    region = "asia-south1"
}

serviceAccountInfo = {
    name = ""
}

networkInfo = {
    name = ""
    auto_create_subnetworks = false
    mtu = 1460
    gke_subnet = {
        name = ""
        ip_cidr_range = "10.0.0.0/24"
        pods_ip_range = {
            range_name = "pods-range"
            ip_cidr_range = "10.2.0.0/16"
        }
        services_ip_range = {
            range_name = "servicess-range"
            ip_cidr_range = "10.3.0.0/16"
        }
    },
    psc_subnet = {
        name = ""
        ip_cidr_range = "10.0.1.0/24"
        purpose = "PRIVATE_SERVICE_CONNECT"
    },
    proxy_subnet = {
        name = ""
        ip_cidr_range = "10.0.2.0/24"
        purpose = "REGIONAL_MANAGED_PROXY"
    },
    operations_subnet = {
        name = "",
        ip_cidr_range = "10.0.3.0/24"
    }
}

firewallPolicyInfo = {
    name = ""
    description = ""
}

firewallPolicyAssocInfo = {
    name = ""
}

firewallRuleInfo = [
    {
        name = ""
        action = "allow"
        description = ""
        direction = "INGRESS"
        disabled = false
        enable_logging = false
        firewall_policy = ""
        priority = 100
        match = {
            src_ip_ranges = ["0.0.0.0/0"]
            layer4_configs = {
                ip_protocol = "tcp"
                ports = ["22"]
            }
        }
    },
    {
        name = ""
        action = "allow"
        description = ""
        direction = "INGRESS"
        disabled = false
        enable_logging = true
        firewall_policy = ""
        priority = 101
        match = {
            src_ip_ranges = ["0.0.0.0/0"]
            layer4_configs = {
                ip_protocol = "tcp"
                ports = ["80", "443", "8080"]
            }
        }
    },
    {
        name = ""
        action = "allow"
        description = ""
        direction = "INGRESS"
        disabled = false
        enable_logging = true
        firewall_policy = ""
        priority = 102
        match = {
            src_ip_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
            layer4_configs = {
                ip_protocol = "tcp"
            }
        }
    },
    {
        name = ""
        action = "allow"
        description = ""
        direction = "EGRESS"
        disabled = false
        enable_logging = false
        firewall_policy = ""
        priority = 103
        match = {
            dest_ip_ranges = ["0.0.0.0/0"]
            layer4_configs = {
                ip_protocol = "tcp"
            }
        }
    }
]

lbipInfo = [
{
    name = ""
},
{
    name = ""
},
{
    name = ""
}]

natipInfo = {
    name = ""
}

routerInfo  = {
    name = ""
    routerNAT = {
        name = ""
    }
}

artifactRegistryInfo = {
    name = ""
    description = " dev repo"
    format = "DOCKER"
}

memstoreInfo = {
    name = ""
    display_name = ""
    tier  = "BASIC"
    sizeInGB = 10
}

fuseStorageInfo = {
    name = ""
    uniform_bucket_level_access = true
    force_destroy = true
    public_access_prevention = "enforced"
}

opsVMInfo = {
    name = ""
    ip_name = ""
    machine_type = "n2d-standard-2"
    zone =  "asia-south1-a"
    boot_disk =  {
        image = "ubuntu-os-cloud/ubuntu-2204-lts"
        size = 30
    }
}