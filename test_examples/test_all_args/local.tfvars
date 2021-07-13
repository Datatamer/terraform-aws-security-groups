ingress_ports       = [8080]
sg_name_prefix      = "terratest-poiuyt"
ingress_cidr_blocks = ["1.2.3.4/32"]
egress_cidr_blocks  = ["1.2.3.4/32"]
tags                = { "TagKey" : "TagValue" }
ingress_protocol    = "all"
egress_protocol     = "all"
