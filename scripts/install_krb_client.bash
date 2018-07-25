#!/bin/bash
#Installing required packages
yum -y install krb5-libs.x86_64 krb5-devel.x86_64 krb5-workstation.x86_64
#Replacing with master FQDN
sed -i "s~kerberos.example.com~krbserverfqdn~g" /etc/krb5.conf