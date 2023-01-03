* Filtrage d'un hôte par l'adresse IP source
`ip.src == 192.168.1.18`
* Filtrage d'un hôte par son adresse IP de destination
`ip.dst == 81.251.151.110`
* Filtrage des paquets destinés ou provenant de/vers une IP spécifique
`ip.addr == 81.251.151.110`
* Filtrage des conversations entre 2 hôtes
`ip.addr eq 81.251.151.110 and ip.addr eq 23.217.250.58`
* Filtrage d'un sous-réseau
`ip.addr ==192.168.1.0/24`
* Filtrage d'une gamme d'adresses IP
`ip.addr >192.168.1.0 and ip.addr <192.168.1.10`
* Filtrage d'un hôte ou d'un sous-réseau
`host: !(ip.addr==192.168.1.4)`
`!(ip.addr==192.168.1.4/24)`
* Filtrage des paquets de plus de 1500 octets (taille MTU par défaut)
`ip.len > 1500`
* Filtrer les paquets qui ne doivent pas être fragmentés
`ip.flags.df == 1`
* Filtrage des paquets corrompus
`ip.checksum_bad.expert`
* Filtrer une IP par une ville, un pays, etc.
`ip.geoip.src_city== "Lübeck"`
`ip.geoip.src_country == "United States"`
* Filtrage des paquets de diffusion et de multidiffusion
`(eth.dst.lg == 1  ) or (eth.addr == ff:ff:ff:ff:ff:ff)`
* Filtrage des paquets IPv4 uniquement
`ip`
* Filtrage des paquets IPv6
`ipv6`

* Wireshark Filter by IP
ip.addr == 10.10.50.1

* Filter by Destination IP
ip.dest == 10.10.50.1

* Filter by Source IP
ip.src == 10.10.50.1

* Filter by IP range
ip.addr >= 10.10.50.1 and ip.addr <= 10.10.50.100

* Filter by Multiple Ips
ip.addr == 10.10.50.1 and ip.addr == 10.10.50.100

* Filter out/ Exclude IP address
!(ip.addr == 10.10.50.1)

* Filter IP subnet
ip.addr == 10.10.50.1/24

* Filter by multiple specified IP subnets
ip.addr == 10.10.50.1/24 and ip.addr == 10.10.51.1/24

* Filter by Protocol
    dns
    http
    ftp
    ssh
    arp
    telnet
    icmp

* Filter by port (TCP)
tcp.port == 25

* Filter by destination port (TCP)
tcp.dstport == 23

* Filter by ip address and port
ip.addr == 10.10.50.1 and Tcp.port == 25

* Filter by URL
http.host == “host name”

* Filter by time stamp
frame.time >= “June 02, 2019 18:04:00”

* Filter SYN flag / Detecting SYN Floods
tcp.flags.syn == 1
tcp.flags.syn == 1 and tcp.flags.ack == 0

* Wireshark Beacon Filter
wlan.fc.type_subtype = 0x08

* Wireshark broadcast filter
eth.dst == ff:ff:ff:ff:ff:ff

* WiresharkMulticast filter
(eth.dst[0] & 1)

* Host name filter
ip.host = hostname

* MAC address filter
eth.addr == 00:70:f4:23:18:c4

* RST flag filter
tcp.flags.reset == 1

* Find user agents
http.user_agent contains Firefox
!http.user_agent contains || !http.user_agent contains Chrome

* Filter three way handshake
tcp.flags.syn==1 or (tcp.seq==1 and tcp.ack==1 and tcp.len==0 and tcp.analysis.initial_rtt)

* Find files by type
frame contains “(attachment|tar|exe|zip|pdf)”

* Find traffic based on keyword
tcp contains facebook
frame contains facebook

* Filter all http get requests and responses
http.request or http.response