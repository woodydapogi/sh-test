#!/bin/bash
# Test Lab Env using Vagrant
# Purpose: Install apache2 service.
# Env: CentOS; Ubuntu
##

IP="$@"
PKG=("httpd" "apache2" "curl")


if [[ $# -eq 0 ]]; then
        echo "usage: $0 [ip_address] - Possible for multiple IP Address."
else
        for ip in $IP; do
                if ping $ip -c 1| grep "Unreach" > /dev/null; then
                        echo "$ip ---- Unreach"
                else
                        echo "$ip ---- Ok."

                        ssh-copy-id vagrant@$ip

                        ssh vagrant@$ip cat /etc/*release* | grep Ubuntu > /dev/null
                        if [[ $? -eq 0 ]]; then
                                echo "Ubuntu"

                                ssh vagrant@$ip sudo apt-get update -y > /dev/null

                                ssh vagrant@$ip sudo apt-get install ${PKG[1]} ${PKG[2]} -y > /dev/null

                                ssh vagrant@$ip sudo curl -I http://localhost

                                ssh vagrant@$ip sudo systemctl enable ${PKG[1]}

                                ssh vagrant@$ip sudo systemctl start ${PKG[1]}

                                ssh vagrant@$ip sudo systemctl status ${PKG[1]}

                        else
                                cat /etc/*release* | grep CentOS

                                echo "CentOS"

                                ssh vagrant@$ip sudo yum update -y > /dev/null

                                ssh vagrant@$ip sudo yum install ${PKG[0]} ${PKG[2]} -y > /dev/null

                                ssh vagrant@$ip sudo curl -I http://localhost

                                ssh vagrant@$ip sudo systemctl enable ${PKG[0]}

                                ssh vagrant@$ip sudo systemctl start ${PKG[0]}

                                ssh vagrant@$ip sudo systemctl status ${PKG[0]}
                        fi
                fi
        done
fi
