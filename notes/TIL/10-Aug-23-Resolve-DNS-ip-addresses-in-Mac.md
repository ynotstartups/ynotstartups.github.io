# TIL - Resolve DNS ip addresses in Mac                              - 10/Aug/23

```bash
❯ dscacheutil -q host -a name google.com
name: google.com
ipv6_address: 2a00:1450:4009:820::200e

name: google.com
ip_address: 142.250.187.238
```

```bash
❯ nslookup google.com
Server:		fe80::1%15
Address:	fe80::1%15#53

Non-authoritative answer:
Name:	google.com
Address: 142.250.187.238
```
