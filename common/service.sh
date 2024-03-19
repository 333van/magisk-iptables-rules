# Subnets
SubnetPrefix="192.168.0"
# Nodes
Desktop="$SubnetPrefix.207"
NAS="$SubnetPrefix.100"
LaptopLAN="$SubnetPrefix.31"
LaptopWLAN="$SubnetPrefix.25"
# Services
ADBD="5555"
SSHD="8022"
#
# to accept
iptables --table filter --append INPUT \
--source "$Desktop,$NAS,$LaptopLAN,$LaptopWLAN" \
--protocol TCP --destination-port "$ADBD" --jump ACCEPT
iptables --table filter --append INPUT \
--source "$Desktop,$NAS,$LaptopLAN,$LaptopWLAN" \
--protocol TCP --destination-port "$SSHD" --jump ACCEPT
#
# to drop
iptables --table filter --append INPUT \
--protocol TCP --destination-port "$ADBD" --jump DROP
iptables --table filter --append INPUT \
--protocol TCP --destination-port "$SSHD" --jump DROP