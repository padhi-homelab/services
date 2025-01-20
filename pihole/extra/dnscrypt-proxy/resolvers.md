# FAST public-resolvers

This is an extensive list of public DNS resolvers supporting the
DNSCrypt and DNS-over-HTTP2 protocols.

This sublist is curated by Saswat Padhi.
Most of the public resolvers are grabbed from the
[much larger list](https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md)
maintained by Frank Denis <j @ dnscrypt [.] info>.
- No filtering
- No logging
- "Decent" latency from US and EU
- Light "vetting" of providers

Check the [`dnscrypt-proxy.toml`](../../config/dnscrypt-proxy/etc/dnscrypt-proxy.toml) configuration file,
in particular the `[sources]` section, for usage example.

--

## a-and-a

Non-filtering, No-logging, DNSSEC DoH operated by Andrews & Arnold LTD.
Homepage: https://www.aa.net.uk/dns/

sdns://AgcAAAAAAAAADTIxNy4xNjkuMjAuMjIADWRucy5hYS5uZXQudWsKL2Rucy1xdWVyeQ
sdns://AgcAAAAAAAAADTIxNy4xNjkuMjAuMjMADWRucy5hYS5uZXQudWsKL2Rucy1xdWVyeQ


## a-and-a-ipv6

Non-filtering, No-logging, DNSSEC DoH over IPv6 operated by Andrews & Arnold LTD.
Homepage: https://www.aa.net.uk/dns/

sdns://AgcAAAAAAAAAEFsyMDAxOjhiMDo6MjAyMl0ADWRucy5hYS5uZXQudWsKL2Rucy1xdWVyeQ
sdns://AgcAAAAAAAAAEFsyMDAxOjhiMDo6MjAyM10ADWRucy5hYS5uZXQudWsKL2Rucy1xdWVyeQ


## ams-dnscrypt-nl

Resolver in Amsterdam. Dnscrypt protocol. Non-logging, non-filtering, DNSSEC.

sdns://AQcAAAAAAAAAETg5LjM4LjEzMS4zODo0MzQzIBI197wcfHaxuMFi9_YgoxSJ1yIDWPfO75iztVhWzk0aHzIuZG5zY3J5cHQtY2VydC5hbXMtZG5zY3J5cHQtbmw


## ams-dnscrypt-nl-ipv6

Resolver in Amsterdam. Dnscrypt protocol. Non-logging, non-filtering, DNSSEC.

sdns://AQcAAAAAAAAAGlsyYTBjOmI5YzA6Zjo0NTFkOjoxXTo0MzQzIBI197wcfHaxuMFi9_YgoxSJ1yIDWPfO75iztVhWzk0aHzIuZG5zY3J5cHQtY2VydC5hbXMtZG5zY3J5cHQtbmw


## ams-doh-nl

Resolver in Amsterdam. HTTP/3, DoH protocol. Non-logging, non-filtering, DNSSEC.

sdns://AgcAAAAAAAAADDg5LjM4LjEzMS4zOKDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRJkbnNubC5hbGVrYmVyZy5uZXQKL2Rucy1xdWVyeQ


## ams-doh-nl-ipv6

Resolver in Amsterdam. HTTP/3, DoH protocol. Non-logging, non-filtering, DNSSEC.

sdns://AgcAAAAAAAAAFVsyYTBjOmI5YzA6Zjo0NTFkOjoxXaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRJkbnNubC5hbGVrYmVyZy5uZXQKL2Rucy1xdWVyeQ


## controld-unfiltered

ControlD Free DNS. Take CONTROL of your Internet. Block unwanted content, bypass geo-restrictions and be more productive. DoH protocol and No logging. - https://controld.com/free-dns

This is a Unfiltered DNS, no DNS record blocking or manipulation here, if you want to block Malware, Ads & Tracking or Social Network domains, use the other ControlD DNS configs.

sdns://AgcAAAAAAAAACjc2Ljc2LjIuMTEAFGZyZWVkbnMuY29udHJvbGQuY29tAy9wMA


## digitalprivacy.diy-dnscrypt-ipv4

IPv4 server | No filter | No logs | DNSSEC | Nuremberg, Germany (netcup) | Maintained by https://digitalprivacy.diy/

sdns://AQcAAAAAAAAAEjM3LjIyMS4xOTQuODQ6NDQzNCCiyGRvm0TcyJmI7lTXstgh-8AoAAiFcTQQp7Od_brTYCIyLmRuc2NyeXB0LWNlcnQuZGlnaXRhbHByaXZhY3kuZGl5


## dns.digitale-gesellschaft.ch

Public DoH resolver operated by the Digital Society (https://www.digitale-gesellschaft.ch).
Hosted in Zurich, Switzerland.

Non-logging, non-filtering, supports DNSSEC.

sdns://AgcAAAAAAAAADTE4NS45NS4yMTguNDKgzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1UcZG5zLmRpZ2l0YWxlLWdlc2VsbHNjaGFmdC5jaAovZG5zLXF1ZXJ5
sdns://AgcAAAAAAAAADTE4NS45NS4yMTguNDOgzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1UcZG5zLmRpZ2l0YWxlLWdlc2VsbHNjaGFmdC5jaAovZG5zLXF1ZXJ5


## dns.digitale-gesellschaft.ch-ipv6

Public IPv6 DoH resolver operated by the Digital Society (https://www.digitale-gesellschaft.ch).
Hosted in Zurich, Switzerland.

Non-logging, non-filtering, supports DNSSEC.

sdns://AgcAAAAAAAAAD1syYTA1OmZjODQ6OjQyXaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRxkbnMuZGlnaXRhbGUtZ2VzZWxsc2NoYWZ0LmNoCi9kbnMtcXVlcnk
sdns://AgcAAAAAAAAAD1syYTA1OmZjODQ6OjQzXaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRxkbnMuZGlnaXRhbGUtZ2VzZWxsc2NoYWZ0LmNoCi9kbnMtcXVlcnk


## dns.digitalsize.net

A public, non-tracking, non-filtering DNS resolver with DNSSEC enabled, QNAME minimization and no EDNS client subnet (https://dns.digitalsize.net).
Hosted in Germany.

sdns://AgcAAAAAAAAADjk0LjEzMC4xMzUuMjAzoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVE2Rucy5kaWdpdGFsc2l6ZS5uZXQKL2Rucy1xdWVyeQ


## dns.digitalsize.net-ipv6

A public, non-tracking, non-filtering DNS resolver with DNSSEC enabled, QNAME minimization and no EDNS client subnet (https://dns.digitalsize.net).
Hosted in Germany.

sdns://AgcAAAAAAAAAGVsyYTAxOjRmODoxM2I6MzQwNzo6ZmFjZV2gzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1UTZG5zLmRpZ2l0YWxzaXplLm5ldAovZG5zLXF1ZXJ5


## dnscry.pt-allentown-ipv4

DNSCry.pt Allentown - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjEzNy4yNTMuMjQg3Z0YI7udXIjKWcPC5GdTm4Uk6D1x2DuyYuj2OZz2cKQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-allentown-ipv6

DNSCry.pt Allentown - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHFsyNjAyOmZjMjQ6MTk6NzRiMDo1Mjg1OjoxMl0g3Z0YI7udXIjKWcPC5GdTm4Uk6D1x2DuyYuj2OZz2cKQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-amsterdam-ipv4

DNSCry.pt Amsterdam - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE5OC4xNDAuMTQxLjQ2IFqbafOxgXuKwOgYxQ6XUqHWkMUt_5LI2nDkdVFU5hm7GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-amsterdam-ipv6

DNSCry.pt Amsterdam - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTAzOjk0ZTM6MjIyYjo6MTAzMl0gWptp87GBe4rA6BjFDpdSodaQxS3_ksjacOR1UVTmGbsZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-amsterdam02-ipv4

DNSCry.pt Amsterdam 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1Ljg2LjE2Mi4xMTAgblxXPJozaH3d0T9h_69Op1nnYQYbW4yIWd8ypOORnK8ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-amsterdam02-ipv6

DNSCry.pt Amsterdam 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syYTA3OmVmYzA6MTAwMTphNWNlOjpiNGI0XSBuXFc8mjNofd3RP2H_r06nWedhBhtbjIhZ3zKk45GcrxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-ashburn-ipv4

DNSCry.pt Ashburn - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAACzQ1LjExLjIzMC44IMGyYyUUH-ohVO5gxPJoOoTQYe6WeqqivutZK9FR5v2eGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-ashburn-ipv6

DNSCry.pt Ashburn - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyMDAxOjQ3MDo4OjE2OTo6MTAwXSDBsmMlFB_qIVTuYMTyaDqE0GHulnqqor7rWSvRUeb9nhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-athens-ipv4

DNSCry.pt Athens - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE4NS4yMzQuNTIuODcg7sJacnOa_EK646WTMceomii6ew1ZjD2YPZq6T3cbAZYZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-athens-ipv6

DNSCry.pt Athens - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTA5OmNkNDM6Zjo0MmExOjo1XSDuwlpyc5r8QrrjpZMxx6iaKLp7DVmMPZg9mrpPdxsBlhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-atlanta-ipv4

DNSCry.pt Atlanta - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE3MC4yNDkuMjM3LjE1NCDi7_UCIU8-uBI-dM7qpE0Y0Qo8GpJTDcSX578fvK7jOhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-atlanta-ipv6

DNSCry.pt Atlanta - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syNjAwOjRjMDA6ODA6ODo6YV0g4u_1AiFPPrgSPnTO6qRNGNEKPBqSUw3El-e_H7yu4zoZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-auckland-ipv4

DNSCry.pt Auckland - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE4NS45OS4xMzMuMTEyIBWQZQSuMzmL_YANsdr26wFOHmJCYEtA2P2JI6w1-0ezGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-auckland-ipv6

DNSCry.pt Auckland - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHFsyYTA2OjEyODA6YmVlMToyOjplZTEyOjIwOF0gFZBlBK4zOYv9gA2x2vbrAU4eYkJgS0DY_YkjrDX7R7MZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-bengaluru-ipv4

DNSCry.pt Bengaluru - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE2MC4xOTEuMTgyLjIxNiDM3lhIXzCtFbHampFM4K_NDUnKalgxd72L-5ye1X4qExkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-bengaluru-ipv6

DNSCry.pt Bengaluru - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyNDAxOmQ0ZTA6MDoxNDA4Ojo1M10gzN5YSF8wrRWx2pqRTOCvzQ1JympYMXe9i_ucntV-KhMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-bogota-ipv4

DNSCry.pt Bogotá - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTEwMy41Ny4yNTAuMzkgUO6G-qXU05kKUTf9uH0cLzUvrGudaxfIJBpJfbeY5bEZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-bogota-ipv6

DNSCry.pt Bogotá - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTAzOmY4MDo1NzozNGQxOjoxXSBQ7ob6pdTTmQpRN_24fRwvNS-sa51rF8gkGkl9t5jlsRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-bratislava-ipv4

DNSCry.pt Bratislava - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjk1LjEzMS4yMDIuMTA1ICNqYnU4LMuHNFVgCP5Zn1414WbRxXWqmbQoFp-KjKepGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-bratislava-ipv6

DNSCry.pt Bratislava - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHVsyYTA1OjU1MDI6OjU5MDY6OTdmODoyZDBlOjFdICNqYnU4LMuHNFVgCP5Zn1414WbRxXWqmbQoFp-KjKepGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-brisbane-ipv4

DNSCry.pt Brisbane - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjQzLjIyNC4xODAuMTM3IB3DhQdApTRyuMIvRSQEdBBZ3zMUZPTPK9hsuS3Nq7c5GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-brisbane-ipv6

DNSCry.pt Brisbane - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAIlsyNDA0Ojk0MDA6MTowOjIxNjozZWZmOmZlZjY6NzE5NF0gHcOFB0ClNHK4wi9FJAR0EFnfMxRk9M8r2Gy5Lc2rtzkZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-brussels-ipv4

DNSCry.pt Brussels - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE5Mi4xMjEuMTcwLjE1MSAT1-NSdE3OfjoVPgHNxNnBX5TUCfS8OtUxrRV9UpJZBxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-brussels-ipv6

DNSCry.pt Brussels - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTAzOmY4MDozMjo1MmQ5OjoxXSAT1-NSdE3OfjoVPgHNxNnBX5TUCfS8OtUxrRV9UpJZBxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-bucharest-ipv4

DNSCry.pt Bucharest - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE4NS45My4yMjEuMTY3IM1gfKbFYfG7eLZj6F7rEF7PGZC7Tl2D_LD9v8cmoW1kGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-bucharest-ipv6

DNSCry.pt Bucharest - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyYTBkOjllYzI6MDpmMDNkOjpjNDllXSDNYHymxWHxu3i2Y-he6xBezxmQu05dg_yw_b_HJqFtZBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-budapest-ipv4

DNSCry.pt Budapest - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NC4xMDIuMjI3LjUg_cf2xKCt4ZqfeHjW_2pukHH4EMfQZR_CVNkIVci8enMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-budapest-ipv6

DNSCry.pt Budapest - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTBlOjFkODA6Mjc6NjI4OTo6MV0g_cf2xKCt4ZqfeHjW_2pukHH4EMfQZR_CVNkIVci8enMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-calgary-ipv4

DNSCry.pt Calgary - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjEzMy42NC4xMjEgbJWMdhm3m3L0MIztiezBT4P4H5YobsrhNoVKl3JcBa0ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-calgary-ipv6

DNSCry.pt Calgary - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyNjAyOmZlZDI6ZmUwOjI4Mzo6MV0gbJWMdhm3m3L0MIztiezBT4P4H5YobsrhNoVKl3JcBa0ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-chicago-ipv4

DNSCry.pt Chicago - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1LjQxLjIwNC4yMDQgbQ_3dUnLx_3R3UeHibflzQIDKCqMGcViiAPftt2eDbIZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-chicago-ipv6

DNSCry.pt Chicago - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAH1syNjAyOmZlYTc6ZTBjOmU6YmZmOjY6NzA6MTk0Y10gbQ_3dUnLx_3R3UeHibflzQIDKCqMGcViiAPftt2eDbIZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-chisinau-ipv4

DNSCry.pt Chișinău - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE3Ni4xMjMuMTAuMTA1IEJtkG567ZvN_tTXhVcSyywcrDRhziwxmbnyohp5u8gPGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-chisinau-ipv6

DNSCry.pt Chișinău - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHVsyMDAxOjY3ODo2ZDQ6NTA4MDo6M2RlYToxMDldIEJtkG567ZvN_tTXhVcSyywcrDRhziwxmbnyohp5u8gPGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-copenhagen-ipv4

DNSCry.pt Copenhagen - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAACzg1LjEyMC44NC41IAQtkx4Ql90wruZmjw-U_klFVM9Mn7MHWgMR_Db140SrGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-copenhagen-ipv6

DNSCry.pt Copenhagen - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHlsyYTBlOjFkODA6MzE6OGE1NjowOmIwZTo1ZTowXSAELZMeEJfdMK7mZo8PlP5JRVTPTJ-zB1oDEfw29eNEqxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-coventry-ipv4

DNSCry.pt Coventry - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1LjE1NS4zNy4xNjUgYEA416mXWNYoWStCKdnM315FgosLrba3F2QBhYR_SZAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-coventry-ipv6

DNSCry.pt Coventry - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyYTBkOmQ4YzA6MDpmMDQzOjo2OTI3XSBgQDjXqZdY1ihZK0Ip2czfXkWCiwuttrcXZAGFhH9JkBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-dallas-ipv4

DNSCry.pt Dallas - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjIzMC4yNTMuOTgg1OKRDMWAtnBoieTPNbjK-OrVjcuML2vQMc6gh-ZmYpAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-dallas-ipv6

DNSCry.pt Dallas - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syNjAyOmZiOTQ6MTozOTo6YV0g1OKRDMWAtnBoieTPNbjK-OrVjcuML2vQMc6gh-ZmYpAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-denver-ipv4

DNSCry.pt Denver - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzIxNi4xMjAuMjAxLjEwNSD_srgVun60gzUrte8QS0YJAqSBHZ_X6PpY_bOU1eMegxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-denver-ipv6

DNSCry.pt Denver - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNjA3OmE2ODA6NjpmMDE2OjozYTI1XSD_srgVun60gzUrte8QS0YJAqSBHZ_X6PpY_bOU1eMegxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-detroit-ipv4

DNSCry.pt Detroit - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDY2LjE4Ny43LjE0MCBpn2OKcwbE01MLSkSXcaPKLf8IOmKbuE9GGZvAOBwaNRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-detroit-ipv6

DNSCry.pt Detroit - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAI1syNjA2OjY1YzA6NDA6NDo1ZjM6NTRjNDo4ZDEwOjliOThdIGmfY4pzBsTTUwtKRJdxo8ot_wg6Ypu4T0YZm8A4HBo1GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-dublin-ipv4

DNSCry.pt Dublin - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NC4yNi4yMTMuMTUgEzWgsAQfbmA1ppXryEJ6vQ3Vvc2Kk2oRkdjodTEYvPQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-dublin-ipv6

DNSCry.pt Dublin - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTA5OmNkNDY6Zjo0MjllOjo1XSATNaCwBB9uYDWmlevIQnq9DdW9zYqTahGR2Oh1MRi89BkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-durham-ipv4

DNSCry.pt Durham - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDM4LjQ1LjY0LjExNyAS3jjOGrb2p9i5bpMiO0WB-XlTLq7Ek3soP2xndELQ8xkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-durham-ipv6

DNSCry.pt Durham - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHVsyMDAxOjU1MDo1YTAwOjVlYjo6ZGI1OmYwMDFdIBLeOM4atvan2LlukyI7RYH5eVMursSTeyg_bGd0QtDzGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-dusseldorf-ipv4

DNSCry.pt Düsseldorf - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE4NS4yNDQuMjcuMTM2IG5RCKZnWcBIWwMJ9wfdIkLhWRuNCczv-aVchrqwIzAmGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-dusseldorf-ipv6

DNSCry.pt Düsseldorf - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyYTBmOjU3MDc6YWE4MTo1ZTNjOjoxXSBuUQimZ1nASFsDCfcH3SJC4VkbjQnM7_mlXIa6sCMwJhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-dusseldorf02-ipv4

DNSCry.pt Düsseldorf 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1LjEzMy43NS4xMjIgWAo_MyYybZGGBQKsA41WpC5TjjpfvgviHteGEKBXNIwZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-dusseldorf02-ipv6

DNSCry.pt Düsseldorf 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTA2OmRlMDA6NDAxOjIyNzo6Ml0gWAo_MyYybZGGBQKsA41WpC5TjjpfvgviHteGEKBXNIwZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-flint-ipv4

DNSCry.pt Flint - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE0Ny4xODkuMTQwLjEzNiCL7wgLXnE-35sDhXk5N1RNpUfWmM2aUBcMFlst7FPdnRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-flint-ipv6

DNSCry.pt Flint - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syNjA2OjY2ODA6Mjk6MTo6NTg1OTphMzdiXSCL7wgLXnE-35sDhXk5N1RNpUfWmM2aUBcMFlst7FPdnRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-frankfurt-ipv4

DNSCry.pt Frankfurt - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NC41MC4xOS4xNTAg-_TD5LiJYj-861zIGFSucHEg_7IT-3T3x8fYWhWrsekZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-frankfurt-ipv6

DNSCry.pt Frankfurt - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAI1syYTBmOjU3MDc6YWI4MDozMzRlOjI6MjoyY2QyOmE4YmNdIPv0w-S4iWI_vOtcyBhUrnBxIP-yE_t098fH2FoVq7HpGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-frankfurt02-ipv4

DNSCry.pt Frankfurt 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1LjE0Ny41MS4xMjMgIXwiAp3nzMSapyRop7AbWNG8rFfD1aGhvvGSXFdfv24ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-frankfurt02-ipv6

DNSCry.pt Frankfurt 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYTA3OmQ4ODQ6MTAwOjozNDRdICF8IgKd58zEmqckaKewG1jRvKxXw9Whob7xklxXX79uGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-fremont-ipv4

DNSCry.pt Fremont - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDIzLjEzNC44OC43MSBywAheyGUw9-6xRRd9vJpQ9_so9hVXnOc-T50u1HjNlxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-fremont-ipv6

DNSCry.pt Fremont - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjAyOmZiYTE6MTAwOjo3MToxXSBywAheyGUw9-6xRRd9vJpQ9_so9hVXnOc-T50u1HjNlxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-fujairah-ipv4

DNSCry.pt Fujairah - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTg5LjM2LjE2Mi4xODcgoviGbbki583h_iXBE6u-lLdJjyIsScLTYL107SA5Y0MZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-fujairah-ipv6

DNSCry.pt Fujairah - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAKFsyYTA2OmY5MDI6NDAwMToxMDA6OTAwMDo5MDAwOjM5YTQ6NWZlYl0goviGbbki583h_iXBE6u-lLdJjyIsScLTYL107SA5Y0MZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-geneva-ipv4

DNSCry.pt Geneva - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjkwLjU5LjE5MyApCKLNC-QxtyiyCC4AQIb36KxxFcalmSGG9V_CLDDyVxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-geneva-ipv6

DNSCry.pt Geneva - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAEFsyYTA1Ojk0MDY6OmFlMV0gKQiizQvkMbcosgguAECG9-iscRXGpZkhhvVfwiww8lcZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-grandrapids-ipv4

DNSCry.pt Grand Rapids - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE4NS4xNjUuNDQuMTY0IIAGv2tc1niHTIQfcnX5-ElHTfAJySTEfHKDgxBlM4O9GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-grandrapids-ipv6

DNSCry.pt Grand Rapids - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syNjAyOmY5NjQ6MToyNDo6YV0ggAa_a1zWeIdMhB9ydfn4SUdN8AnJJMR8coODEGUzg70ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-hafnarfjordur-ipv4

DNSCry.pt Hafnarfjordur - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE1MS4yMzYuMjQuMTkwINhtfHvc3U5cE6_kslAZJswpzjhgvYKQY7Wt6YCi6hIWGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-hafnarfjordur-ipv6

DNSCry.pt Hafnarfjordur - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTAzOmY4MDozNTQ6MzhiNzo6MV0g2G18e9zdTlwTr-SyUBkmzCnOOGC9gpBjta3pgKLqEhYZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-halifax-ipv4

DNSCry.pt Halifax - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDIzLjE5MS44MC43MiDWU4t3XLrMS6HgwPKxB17yx4QrCA3dwd2kWcDZNhlkzRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-halifax-ipv6

DNSCry.pt Halifax - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjAyOmZjMWM6ZmEwOjExOjoxXSDWU4t3XLrMS6HgwPKxB17yx4QrCA3dwd2kWcDZNhlkzRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-hanoi-ipv4

DNSCry.pt Hanoi - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTEwMy4xOTkuMTYuOTMg6iF-oJet7zyL2odP--IayA5Wrz6t94RPc7PXF53V82cZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-hanoi-ipv6

DNSCry.pt Hanoi - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNDA0OmZiYzA6MDoxMWM4OjphMzI0XSDqIX6gl63vPIvah0_74hrIDlavPq33hE9zs9cXndXzZxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-helsinki-ipv4

DNSCry.pt Helsinki - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjM3LjIyOC4xMjkuMTYwIPlYPWSML8DlYbkp1ycL3CBER_3aJHp7GLvX_TRvbojGGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-helsinki-ipv6

DNSCry.pt Helsinki - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTA2OjE3MDA6MTozYTo6Y2JhXSD5WD1kjC_A5WG5KdcnC9wgREf92iR6exi71_00b26IxhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-hochiminhcity-ipv4

DNSCry.pt Ho-Chi-Minh City - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE1Ny4yMC44My4xMzUgjO-Llfy6TK7yRAZaDd6xpzGDj51mcPeGAttNfFcI0ZYZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-hochiminhcity-ipv6

DNSCry.pt Ho-Chi-Minh City - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNDAwOjZlYTA6MDoxMWFlOjphZGM0XSCM74uV_LpMrvJEBloN3rGnMYOPnWZw94YC2018VwjRlhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-hongkong-ipv4

DNSCry.pt Hong Kong - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAACzg5LjIxMy4wLjE0IHWDuWQXR3NTJczPQcQrdDLB_78taTxJCYrloFfv5W0TGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-hongkong-ipv6

DNSCry.pt Hong Kong - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syYTEzOjgyYzE6NWUwYzo6MV0gdYO5ZBdHc1MlzM9BxCt0MsH_vy1pPEkJiuWgV-_lbRMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-hongkong02-ipv4

DNSCry.pt Hong Kong 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDkxLjEyNC4zMC4zMSDyo1sS6VmTaElhosn2gJ09M8GXw5noLXSJV4f-VKvDGBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-hongkong02-ipv6

DNSCry.pt Hong Kong 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjAyOmZhNjc6MTAxOjIwOjphXSDyo1sS6VmTaElhosn2gJ09M8GXw5noLXSJV4f-VKvDGBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-houston-ipv4

DNSCry.pt Houston - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjIwOS4xMzUuMTcwLjUxIL7wIivFyCM_iTK5qztmXyFfpynhWd1IcovrboT0T4VsGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-houston-ipv6

DNSCry.pt Houston - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyNjAyOmY5ZjM6MDoyOjoxOTNdIL7wIivFyCM_iTK5qztmXyFfpynhWd1IcovrboT0T4VsGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-hudiksvall-ipv4

DNSCry.pt Hudiksvall - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjk1LjE0My4xOTYuMTkwIIe6V4-SeKbsyNllxXsYRoqK7NDU9EtUn7yp48YWeEu9GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-hudiksvall-ipv6

DNSCry.pt Hudiksvall - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHFsyYTAzOmQ3ODA6MDoxOTY6OjNlODQ6NTZhZl0gh7pXj5J4puzI2WXFexhGiors0NT0S1SfvKnjxhZ4S70ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-islamabad-ipv4

DNSCry.pt Islamabad - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzEwMy4xNTEuMTExLjE3NCC9ck9MCNpysOp-XjsEWzVP5nxv-R4d52xZp_LSeH4R7hkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-islamabad-ipv6

DNSCry.pt Islamabad - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syMDAxOmRmMjpkNDA6MTc6OmJhYmFdIL1yT0wI2nKw6n5eOwRbNU_mfG_5Hh3nbFmn8tJ4fhHuGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-istanbul-ipv4

DNSCry.pt Istanbul - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5My4yMjguMS4xMzAgXK0o7fAtGbbqsMWn6eFc8pQ3_Tf3YrD64C9ZuBjV-l0ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-istanbul-ipv6

DNSCry.pt Istanbul - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syYTEyOmUzNDI6MjAwOjoyOjE4MTldIFytKO3wLRm26rDFp-nhXPKUN_0392Kw-uAvWbgY1fpdGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-jacksonville-ipv4

DNSCry.pt Jacksonville - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzEwNC4yMjUuMTI5LjEwNiAKQZEj8OAMOEB3ZaY36Jovz59wKeyFhBAMV6eOK384rhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-jacksonville-ipv6

DNSCry.pt Jacksonville - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNjA3OmE2ODA6NDpmMDAzOjplYzMyXSAKQZEj8OAMOEB3ZaY36Jovz59wKeyFhBAMV6eOK384rhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-jakarta-ipv4

DNSCry.pt Jakarta - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTEwMy43Ni4xMjkuOTQgyn6S3ZBNV4fF8e7OwGbxj6P8udNOV2Epsd8DrUohOx8ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-jakarta-ipv6

DNSCry.pt Jakarta - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAIFsyNDA3OjZhYzA6Mzo1OjEyMzQ6ZTM0ZTo3MmU0OjFdIMp-kt2QTVeHxfHuzsBm8Y-j_LnTTldhKbHfA61KITsfGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-johannesburg-ipv4

DNSCry.pt Johannesburg - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE2OS4yMzkuMTI4LjEyNCDPBt-20rnrKqM3G3-ZKudPSvU9-zClzYY5-F2KRJSgsBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-johannesburg-ipv6

DNSCry.pt Johannesburg - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYzBmOmY1MzA6OmQwMDoxODhdIM8G37bSuesqozcbf5kq509K9T37MKXNhjn4XYpElKCwGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-johor-ipv4

DNSCry.pt Johor - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTQ1LjI0OS45MS4xNTAgHONiOhMA1VOPBBcvrkvy9IW-Q0dhA1aY-g5rKbpy9noZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-johor-ipv6

DNSCry.pt Johor - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyMDAxOmRmNDoxODQwOjlmOjphXSAc42I6EwDVU48EFy-uS_L0hb5DR2EDVpj6DmspunL2ehkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-kansascity-ipv4

DNSCry.pt Kansas City - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjE1MC40MC4xMjEgQprQrFLF3Y2975ylDjnD8kdKAJLUvauubVrBGueEkcgZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-kansascity-ipv6

DNSCry.pt Kansas City - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGVsyNjAyOjJiNzpkMDE6YzI5NTo6YjoxOF0gQprQrFLF3Y2975ylDjnD8kdKAJLUvauubVrBGueEkcgZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-kharkiv-ipv4

DNSCry.pt Kharkiv - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE5My4yMzguMTUzLjE3IG2aHSWgTHM0_Uy0coL03hWlRhQ23saGZAQFPzr3GQklGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-kharkiv-ipv6

DNSCry.pt Kharkiv - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYTAyOjI3YTg6ZmVlZDo6ODFdIG2aHSWgTHM0_Uy0coL03hWlRhQ23saGZAQFPzr3GQklGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-kyiv-ipv4

DNSCry.pt Kyiv - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIxNy4xMi4yMjEuNjEgskgLubDTWs4bK9zH1IXKRYSylrG8XVPGWMJpUM37vwUZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-kyiv-ipv6

DNSCry.pt Kyiv - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAEFsyYTAyOjI3YWQ6OjIwMV0gskgLubDTWs4bK9zH1IXKRYSylrG8XVPGWMJpUM37vwUZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lagos-ipv4

DNSCry.pt Lagos - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE3Ni45Ny4xOTIuMTIgcCgpSUHINZEdZRhbgwLZOUR6fOPJU5L4bY9g88TbNusZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lagos-ipv6

DNSCry.pt Lagos - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAH1syYTA2OmY5MDE6NDAwMToxMDA6OjJkNmM6NzM2YV0gcCgpSUHINZEdZRhbgwLZOUR6fOPJU5L4bY9g88TbNusZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lasvegas-ipv4

DNSCry.pt Las Vegas - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIwOS4xNDEuNDUuMjcgxObWYoxN9G0beY5ta20qYDsWjcrgoJsnpi7ILY0M9C4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lasvegas-ipv6

DNSCry.pt Las Vegas - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAJVsyNjA1OjY0MDA6MjA6MjI1ODo3YWNiOjkxZmY6MjA5ODphOV0gxObWYoxN9G0beY5ta20qYDsWjcrgoJsnpi7ILY0M9C4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-libertylake-ipv4

DNSCry.pt Liberty Lake - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDIzLjE4NC40OC4xOSCwg3q2XK6z70eHJhi0H7whWQ_ZWQylhMItvqKpd9GtzRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-libertylake-ipv6

DNSCry.pt Liberty Lake - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNjAyOmZjMjQ6MTg6MzNmMjo6YWIxXSCwg3q2XK6z70eHJhi0H7whWQ_ZWQylhMItvqKpd9GtzRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-lima02-ipv4

DNSCry.pt Lima 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDg3LjEyMS45OS4yMyBLyNV6BQU_iwNJcoib09jF8sIn-ucAJBLfUIuXHZQD1hkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-lima02-ipv6

DNSCry.pt Lima 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syYTAzOjkwYzA6NTU1Ojo3Ml0gS8jVegUFP4sDSXKIm9PYxfLCJ_rnACQS31CLlx2UA9YZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lisbon-ipv4

DNSCry.pt Lisbon - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE4NS4yMTkuMTMwLjIgHK9ZDGB_hDz_YHLGqdsTmT_RzQElksp6DBaYUSXst2oZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-lisbon-ipv6

DNSCry.pt Lisbon - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGlsyYTBlOmJjMDA6OjE4NToyMTk6MTMwOjJdIByvWQxgf4Q8_2ByxqnbE5k_0c0BJZLKegwWmFEl7LdqGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-london-ipv4

DNSCry.pt London - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjY3Ljg0LjEzMiCPZtxEvrtixgzqLZkrkl_-HL7-Cau2YUCEF2vb8sox7hkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-london-ipv6

DNSCry.pt London - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYTA1OjQxNDA6NzAwOmU6OmFdII9m3ES-u2LGDOotmSuSX_4cvv4Jq7ZhQIQXa9vyyjHuGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-losangeles-ipv4

DNSCry.pt Los Angeles - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIxNi43My4xNTYuNTIgQPqVSpp9LaGAokzvLnoFqfiznQU98yJqahlccYqp-EEZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-losangeles-ipv6

DNSCry.pt Los Angeles - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjAyOmZhZmQ6OTAyOjIwOjphXSBA-pVKmn0toYCiTO8uegWp-LOdBT3zImpqGVxxiqn4QRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-losangeles02-ipv4

DNSCry.pt Los Angeles 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEwNC4yMDAuNjcuMTk0IIhxeSuGQHwchZdstQqcoKD_RAuV4w8Qr_1XmXFZucGEGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-losangeles02-ipv6

DNSCry.pt Los Angeles 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syNjAyOmZmNzU6NzpiNzk6OmI0YjRdIIhxeSuGQHwchZdstQqcoKD_RAuV4w8Qr_1XmXFZucGEGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-luxembourg-ipv4

DNSCry.pt Luxembourg - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjgwLjIwOS41NSBRqTRnzxNNFAm2RL2O30OikS0iH19NmFv0HfSfn7-8NBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-luxembourg-ipv6

DNSCry.pt Luxembourg - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syYTAzOjkwYzA6ODU6OjEwMl0gUak0Z88TTRQJtkS9jt9DopEtIh9fTZhb9B30n5-_vDQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-madrid-ipv4

DNSCry.pt Madrid - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTUuMTM0LjExOC4xOTggF4pp6ab33hO4Nb9tp8zuU8Drkh2GcvzYZikut4DIHN8ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-madrid-ipv6

DNSCry.pt Madrid - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syYTAzOmM3YzA6NTI6MjY0MToxODA6OjEzXSAXimnppvfeE7g1v22nzO5TwOuSHYZy_NhmKS63gMgc3xkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-manchester-ipv4

DNSCry.pt Manchester - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTgxLjE4MS4xMDguNDAg8vn0M0oHAF39xBc4UdC7YUwU27O6do5bSz-AlR5pz-MZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-manchester-ipv6

DNSCry.pt Manchester - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHVsyYTBlOjFkODA6NTo4MmU5OjU2Nzg6OTEwOjpdIPL59DNKBwBd_cQXOFHQu2FMFNuzunaOW0s_gJUeac_jGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-miami-ipv4

DNSCry.pt Miami - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEyOC4yNTQuMjA3LjUwIIOGZgtvk9SmJ8GODlVlvGnZKIbEK66_WlJnYWU6rED7GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-miami-ipv6

DNSCry.pt Miami - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyNjAyOmZhZmQ6ZmIyOjE6OmFdIIOGZgtvk9SmJ8GODlVlvGnZKIbEK66_WlJnYWU6rED7GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-milan-ipv4

DNSCry.pt Milan - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIxNy4xNTYuNTAuMjUgUjkX7nXh6Lfn1wuvsca7nm85e_I5RbNqLBNHkJU2CPgZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-milan-ipv6

DNSCry.pt Milan - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTBlOjFkODA6MjE6OWNjMjo6MV0gUjkX7nXh6Lfn1wuvsca7nm85e_I5RbNqLBNHkJU2CPgZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-montreal-ipv4

DNSCry.pt Montreal - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE0Ny4xODkuMTM2LjE4MyCsCFB6EkMJdZLQ-IlsBbtjtSlasCfsTx7Q6u0bOI8OwBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-montreal-ipv6

DNSCry.pt Montreal - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGlsyNjA2OjY2ODA6NDU6MTo6Zjc4Yzo5YjBdIKwIUHoSQwl1ktD4iWwFu2O1KVqwJ-xPHtDq7Rs4jw7AGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-moscow-ipv4

DNSCry.pt Moscow - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjkzLjE4My4xMDUuMTA5ILd1Dg3kVS2KnYl7fYwUcgH4FR9_IEVgO5QViShZy4WCGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-moscow-ipv6

DNSCry.pt Moscow - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYTBjOmM1ODA6MDoxOjoyOjFdILd1Dg3kVS2KnYl7fYwUcgH4FR9_IEVgO5QViShZy4WCGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-mumbai-ipv4

DNSCry.pt Mumbai - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEwMy4xMTEuMTE0LjI1IENdCfc5GHRGIG-JtMeIw2cVTN1nHG4kan0vc_aonHWDGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-mumbai-ipv6

DNSCry.pt Mumbai - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAH1syYTA2OmY5MDI6ODAwMToxMDA6OjE3NTc6ZTYxN10gQ10J9zkYdEYgb4m0x4jDZxVM3WccbiRqfS9z9qicdYMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-munich-ipv4

DNSCry.pt Munich - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NC4zOS4yMDUuMTAgQtC7u79NGEO2MGscsRWQJwJZy8mvvDwc1gpY_VjEf2IZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-munich-ipv6

DNSCry.pt Munich - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGlsyYTBjOjhmYzA6MTc0OTo2NjoxODo6MTZdIELQu7u_TRhDtjBrHLEVkCcCWcvJr7w8HNYKWP1YxH9iGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-naaldwijk-ipv4

DNSCry.pt Naaldwijk - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjEzNy4yNDkuMjYgCA4-g3tus39pqm78_CoOc8byRBbLfuc5ceEiFNFWnN4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-naaldwijk-ipv6

DNSCry.pt Naaldwijk - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNjAyOmZjMjQ6MTI6OTg3Mzo6YWIxXSAIDj6De26zf2mqbvz8Kg5zxvJEFst-5zlx4SIU0Vac3hkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-newyork-ipv4

DNSCry.pt New York - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjU5LjE3MC4xNyDRbG8-ZNXBEkjpwuDK82YYe358Lp4ekvsALVyKPZnuvBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-newyork-ipv6

DNSCry.pt New York - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyNjAyOmZhZmQ6ZjMwOjI6OmFdINFsbz5k1cESSOnC4MrzZhh7fnwunh6S-wAtXIo9me68GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-nuremberg-ipv4

DNSCry.pt Nuremberg - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIwMi42MS4yMzYuNjcgr2UzWGeubsFSZXP-_a8P2GA-gsZJ81sKZuhdsgsGqscZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-nuremberg-ipv6

DNSCry.pt Nuremberg - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAJVsyYTAzOjQwMDA6NWM6NTE6MjRiOTo1MWZmOmZlODA6ZjNhN10gr2UzWGeubsFSZXP-_a8P2GA-gsZJ81sKZuhdsgsGqscZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-oradea-ipv4

DNSCry.pt Oradea - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5My4zMi44Ny4xMjcgqGZV4dUptaXgY6MX4VJhhQfNcTb8Kd0AVhegLHQzJogZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-oradea-ipv6

DNSCry.pt Oradea - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHlsyYTBkOjgxNDM6MDoxMjQ6MjkxNTphZjowOjE4XSCoZlXh1Sm1peBjoxfhUmGFB81xNvwp3QBWF6AsdDMmiBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-ottoville-ipv4

DNSCry.pt Ottoville - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzEwNC4yMzQuMjMxLjIzOSBVJyZb_D0SazeybnfWj5DWZ8NUgxii-zg9r-N8VNSWtBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-ottoville-ipv6

DNSCry.pt Ottoville - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syNjAyOmY5NTM6NjoyNTo6YV0gVScmW_w9Ems3sm531o-Q1mfDVIMYovs4Pa_jfFTUlrQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-paris-ipv4

DNSCry.pt Paris - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAACzg5LjExNy4yLjE3IAXdC7hGEegKD86br-tVRwZTcJfJZAEFjW4jCV5lzdutGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-paris-ipv6

DNSCry.pt Paris - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHlsyNDAyOmQwYzA6MjI6NmNkMDo0OjQ6NDo1YjgxXSAF3Qu4RhHoCg_Om6_rVUcGU3CXyWQBBY1uIwleZc3brRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-philadelphia-ipv4

DNSCry.pt Philadelphia - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE1NC4xNi4xNTkuMjIg2_tLIEpyMKwEhbD7PirfNwPUvZUnTM4z8F8DVkeQI3oZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-philadelphia-ipv6

DNSCry.pt Philadelphia - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjA0OmJmMDA6MjEwOjEyOjoyXSDb-0sgSnIwrASFsPs-Kt83A9S9lSdMzjPwXwNWR5AjehkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-phoenix-ipv4

DNSCry.pt Phoenix - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE3My4yNDkuMjAzLjUyIC7cQyu7dTkvrH-MdwA3fzAkI_2dEUnZd3x1ON0tfYubGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-phoenix-ipv6

DNSCry.pt Phoenix - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syNjA3OjFlNDA6MToxMGE0OjoxOTpjYTg0XSAu3EMru3U5L6x_jHcAN38wJCP9nRFJ2Xd8dTjdLX2LmxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-portedwards-ipv4

DNSCry.pt Port Edwards - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE3Ni4xMTEuMjE5LjEyNiDzuja5nmAyDvA5jakqkuLQEtb245xsAhNwJYDLkKraKhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-portedwards-ipv6

DNSCry.pt Port Edwards - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyMDAxOjQ3MDoxZjExOjJiYjo6YjIzXSDzuja5nmAyDvA5jakqkuLQEtb245xsAhNwJYDLkKraKhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-portland-ipv4

DNSCry.pt Portland - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzEwMy4xMjQuMTA2LjIzMyCN5S36eWstGFliH6xl8Mg2gyF99cqzMzgoJfAtWVYJnhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-portland-ipv6

DNSCry.pt Portland - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAIVsyNDAyOmQwYzA6MTY6YTFlNjowOmI4OTM6YmY3OmRkXSCN5S36eWstGFliH6xl8Mg2gyF99cqzMzgoJfAtWVYJnhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-prague-ipv4

DNSCry.pt Prague - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE5NS4xMjMuMjQ1LjE5ID_cR_36ozMvCvR_yzODoHfX8nlpO7p7IBsbqZU5pQIEGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-prague-ipv6

DNSCry.pt Prague - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAEFsyYTA1Ojk0MDM6Ojk5OV0gP9xH_fqjMy8K9H_LM4Ogd9fyeWk7unsgGxuplTmlAgQZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-redditch-ipv4

DNSCry.pt Redditch - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjY3Ljg1LjIxOSDF35bt83M1j2hvqqgOyB1Rv_pQ0LYZCpGkTuXWt6JGlBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-redditch-ipv6

DNSCry.pt Redditch - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyYTA1OjQxNDA6MTk6NTM6OmFdIMXflu3zczWPaG-qqA7IHVG_-lDQthkKkaRO5da3okaUGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-riga-ipv4

DNSCry.pt Riga - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE5NS4xMjMuMjEyLjIwMCCKpSwU2DoHr1tktJRs4UIiLfoXBly8F7WmgX74sIHRyhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-riga-ipv6

DNSCry.pt Riga - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAEVsyYTAyOjI3YWM6OjEyNDldIIqlLBTYOgevW2S0lGzhQiIt-hcGXLwXtaaBfviwgdHKGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-saltlakecity-ipv4

DNSCry.pt Salt Lake City - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEwMy4xMTQuMTYyLjY1IKbTxlVrc12BNolzMCksgqjW75nTqlnHp95UlrGWqm-UGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-saltlakecity-ipv6

DNSCry.pt Salt Lake City - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAIVsyNDAyOmQwYzA6MTg6YzhmZjowOmI4OTM6YmY3OmRkXSCm08ZVa3NdgTaJczApLIKo1u-Z06pZx6feVJaxlqpvlBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-sandefjord-ipv4

DNSCry.pt Sandefjord - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NC4zMi4xMDcuNDggXTsyJ8l_6LJ4TCwKbGyVeIVM1yLzf8sxL2PmKjZIMvcZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-sandefjord-ipv6

DNSCry.pt Sandefjord - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTAzOjk0ZTA6MjcxZjo6NWIxXSBdOzInyX_osnhMLApsbJV4hUzXIvN_yzEvY-YqNkgy9xkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-santaclara-ipv4

DNSCry.pt Santa Clara - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE3Ni4xMTEuMjIzLjE2NyCmqAI-1fpR1qtHZyAx3vJJ7SpKXkdmPAnZZ5ga25JckxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-santaclara-ipv6

DNSCry.pt Santa Clara - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syNjA2OjY2ODA6MzU6MTo6NTA2ZDo4Y2UyXSCmqAI-1fpR1qtHZyAx3vJJ7SpKXkdmPAnZZ5ga25JckxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-saopaulo-ipv4

DNSCry.pt Sao Paulo - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEwOC4xODEuNjkuMTUzIKai-Qjyp6DgYnQVy1gEzvb3-NTklTiCmy4Afgv7TRJVGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-saopaulo-ipv6

DNSCry.pt Sao Paulo - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHlsyNjA0OjY2MDA6ZmQwMDo5MDo6MWI4YjozYTNjXSCmovkI8qeg4GJ0FctYBM729_jU5JU4gpsuAH4L-00SVRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-seattle-ipv4

DNSCry.pt Seattle - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzIwOS4xODIuMjI1LjEwMyAbREpgYMxYxNqglLJnR6df63qELMlAVMwxGlsjPMMThhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-seattle-ipv6

DNSCry.pt Seattle - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNjA3OmE2ODA6OTpmMDA1Ojo4NmU3XSAbREpgYMxYxNqglLJnR6df63qELMlAVMwxGlsjPMMThhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-seoul-ipv4

DNSCry.pt Seoul - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTkyLjM4LjEzNS4xMjggyHfVGamJyxLfoAWjERmO4pY3KzKkqY-vSa2UnVx_gYAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-seoul-ipv6

DNSCry.pt Seoul - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syYTAzOjkwYzA6MTI1Ojo4OF0gyHfVGamJyxLfoAWjERmO4pY3KzKkqY-vSa2UnVx_gYAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-singapore-ipv4

DNSCry.pt Singapore - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIzLjI3LjEwMS4xOTEgX4DtgHar8KftBn3jpccW4O8BQ2VFctwhwu_rMfmCWsYZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-singapore-ipv6

DNSCry.pt Singapore - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjA2OmZjNDA6NDAwMzpmOjphXSBfgO2Adqvwp-0GfeOlxxbg7wFDZUVy3CHC7-sx-YJaxhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-singapore02-ipv4

DNSCry.pt Singapore 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTEwMy4xNzkuNDQuNzMgICxK5c5XamgK_BNMTtSKyEnZM4D44NPAIHddngTPbGUZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-singapore02-ipv6

DNSCry.pt Singapore 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syNDAzOmNmYzA6MTExNDoxMGU6OmFdICAsSuXOV2poCvwTTE7UishJ2TOA-ODTwCB3XZ4Ez2xlGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-sofia-ipv4

DNSCry.pt Sofia - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAACzc5LjEyNC43Ny4zIGjOJralcFGh38dFov6MP6OkkaSPIlSCbku5I7J2NZUfGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-sofia-ipv6

DNSCry.pt Sofia - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTAxOjg3NDA6MTo0MDo6OGEyNV0gaM4mtqVwUaHfx0Wi_ow_o6SRpI8iVIJuS7kjsnY1lR8ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-spokane-ipv4

DNSCry.pt Spokane - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTEwNC4zNi44Ni4xODEg_ifyAp41KOphKBVIwROBjWV91n9fuUzlzUqXCIklST0ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-spokane-ipv6

DNSCry.pt Spokane - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFFsyNjA2OmE4YzA6MzoyMDI6OmFdIP4n8gKeNSjqYSgVSMETgY1lfdZ_X7lM5c1KlwiJJUk9GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-stockholm-ipv4

DNSCry.pt Stockholm - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE4NS4xOTUuMjM2LjYyIBs-wdms4LUcYsk1gE7X2G0U7jqOAxC0ihiHfIwVJAYTGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-stockholm-ipv6

DNSCry.pt Stockholm - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTA5OmIyODA6ZmUwMTozNTo6YV0gGz7B2azgtRxiyTWATtfYbRTuOo4DELSKGId8jBUkBhMZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-sydney-ipv4

DNSCry.pt Sydney - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDg0LjMzLjE1LjEwMCBq8e6bhSwgentAeVRR__dhXfcSy86CtQPtq0vb_Cl18hkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-sydney-ipv6

DNSCry.pt Sydney - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAH1syYTBjOjhmYzE6ODAwNDo1NTM6OjE0NWE6YmJmOV0gavHum4UsIHp7QHlUUf_3YV33EsvOgrUD7atL2_wpdfIZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-sydney02-ipv4

DNSCry.pt Sydney 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE5NS4xMTQuMTQuNzQgfD7v3z2SLbLGuO4Wo8-HYVxwRz44PitWMFgp81gvSjUZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-sydney02-ipv6

DNSCry.pt Sydney 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGFsyNDAyOjczNDA6NTAwMDo2MjAwOjphXSB8Pu_fPZItssa47hajz4dhXHBHPjg-K1YwWCnzWC9KNRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-taipeh-ipv4

DNSCry.pt Taipeh - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjEwMy4xMzEuMTg5LjExIIMLIy-_BnvJTc23i9iX0LlOgTzBwtumxbxntod8ri75GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-taipeh-ipv6

DNSCry.pt Taipeh - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGlsyNDAzOmNmYzA6MTAwNDozNjk6OjViMjFdIIMLIy-_BnvJTc23i9iX0LlOgTzBwtumxbxntod8ri75GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-tallinn-ipv4

DNSCry.pt Tallinn - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE4NS4xOTQuNTMuMjIgr0WageGep9cjA5yYpY30Z6EsTYHZnSlV-PCfvZssTNcZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-tallinn-ipv6

DNSCry.pt Tallinn - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAElsyYTA0OjZmMDA6NDo6MTdhXSCvRZqB4Z6n1yMDnJiljfRnoSxNgdmdKVX48J-9myxM1xkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tampa-ipv4

DNSCry.pt Tampa - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADzE2NS4xNDAuMTE3LjI0OCBfK4fFWjW65PRF3_42MZM1Ly9t0ZLHdDA_0uy63rk0zBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tampa-ipv6

DNSCry.pt Tampa - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAIlsyNjAyOmZjYzA6MjIyMjowOmZmMjQ6YTJjNzoxOWM6MV0gXyuHxVo1uuT0Rd_-NjGTNS8vbdGSx3QwP9Lsut65NMwZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-taos-ipv4

DNSCry.pt Taos - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjYzLjEzMy4yMjMuMTM4IIggy47qNTs0s0PnLuDK5UcpSJt_t7XVmTr0tWn1QlqNGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-taos-ipv6

DNSCry.pt Taos - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAG1syNjA2OjY2ODA6NTM6MTo6ODQ2YTpiZDc5XSCIIMuO6jU7NLND5y7gyuVHKUibf7e11Zk69LVp9UJajRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tbilisi-ipv4

DNSCry.pt Tbilisi - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE5NC4xMzUuMTE5LjkzIC1Ic5tvXD4s8NzqITuCwVLnBFJHu7yZ5ImAEEXxtjytGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-tbilisi-ipv6

DNSCry.pt Tbilisi - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGlsyYTEyOmUzNDA6MzAwOjpiYzM0OjkzZTRdIC1Ic5tvXD4s8NzqITuCwVLnBFJHu7yZ5ImAEEXxtjytGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-telaviv-ipv4

DNSCry.pt Tel Aviv - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjE0Ni4xODUuMjE5LjI0IDYsa6yLmjrVde4WRv7r92b1PxOvB3GC0ejgjsv4bt7AGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-telaviv-ipv6

DNSCry.pt Tel Aviv - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAElsyYTAzOjkwYzA6MWU1OjpkXSA2LGusi5o61XXuFkb-6_dm9T8TrwdxgtHo4I7L-G7ewBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tokyo-ipv4

DNSCry.pt Tokyo - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDQ1LjY3Ljg2LjEyMyBDK5aRHZnKfdd6Q9ufEJY83WAQ9X5z7OAQa5CeptBCYBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tokyo-ipv6

DNSCry.pt Tokyo - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjA2OmZjNDA6NDAwMjpkOjphXSBDK5aRHZnKfdd6Q9ufEJY83WAQ9X5z7OAQa5CeptBCYBkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tokyo02-ipv4

DNSCry.pt Tokyo 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDEwMy4xNzkuNDUuNiDfai5sp1im-BPHwbM1GCnTqn20FIbQfuvvybKsGf0pjhkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tokyo02-ipv6

DNSCry.pt Tokyo 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAE1syYTBhOjYwNDA6OTczZDo6YV0g32oubKdYpvgTx8GzNRgp06p9tBSG0H7r78myrBn9KY4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-toronto-ipv4

DNSCry.pt Toronto - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDIzLjEzNC44OS4yMyB4hEFNFQU627_7pPlQl-k6TkU1hGlpOEZe7eg7V1tODRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-toronto-ipv6

DNSCry.pt Toronto - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyNjAyOmZiYTE6ZDAwOjoyMzoxXSB4hEFNFQU627_7pPlQl-k6TkU1hGlpOEZe7eg7V1tODRkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-tuusula-ipv4

DNSCry.pt Tuusula - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTY1LjIxLjI1Mi4yMDEgIhe-u4w5oFAMptmgzUFqc-mgyjjRlnH70fwVqSiHJfkZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-tuusula-ipv6

DNSCry.pt Tuusula - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syYTAxOjRmOTpjMDExOmI4NGU6OjFdICIXvruMOaBQDKbZoM1BanPpoMo40ZZx-9H8FakohyX5GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-valdivia-ipv4

DNSCry.pt Valdivia - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTIxNi43My4xNTkuMjYgnpr1thxYT4SkWK38OEbiPOQa3NSVayBN7f8BkMVREC8ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-valdivia-ipv6

DNSCry.pt Valdivia - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFVsyYTA2OmEwMDY6ZDFkMTo6MTE2XSCemvW2HFhPhKRYrfw4RuI85Brc1JVrIE3t_wGQxVEQLxkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-vancouver-ipv4

DNSCry.pt Vancouver - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADDIzLjE1NC44MS45MiAGyG9Uh1Ra0QN3Ge2n_OYHW8h263tF9bF2GwyXRAaC7xkyLmRuc2NyeXB0LWNlcnQuZG5zY3J5LnB0


## dnscry.pt-vienna-ipv4

DNSCry.pt Vienna - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTgzLjEzOC41NS4xODYg3kyI1rUYwQymzbrF1c5fYhw1rWmOTm8L6i1aISwm6y4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-vienna-ipv6

DNSCry.pt Vienna - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAHVsyYTBkOmYzMDI6MTEwOjY1MTc6OmJiNDoyMTRdIN5MiNa1GMEMps26xdXOX2IcNa1pjk5vC-otWiEsJusuGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-vilnius-ipv4

DNSCry.pt Vilnius - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTE2Mi4yNTQuODYuMTMg4nDDbNqRwkkkZWTJ5c82d1sbs0NeQCbn-aFldCI2mn4ZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-vilnius-ipv6

DNSCry.pt Vilnius - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAF1syYTEzOjk0MDE6MDoxOjozZDU4OjFdIOJww2zakcJJJGVkyeXPNndbG7NDXkAm5_mhZXQiNpp-GTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-warsaw02-ipv4

DNSCry.pt Warsaw 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADjg4LjIxOC4yMDYuMTM3IE42BnReymaCMKWg_FWRMirGsBpqOOzlekDh8UwsfVEQGTIuZG5zY3J5cHQtY2VydC5kbnNjcnkucHQ


## dnscry.pt-warsaw02-ipv6

DNSCry.pt Warsaw 02 - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAFlsyYTA5OmIyODA6ZmUwMDoyNDo6YV0gTjYGdF7KZoIwpaD8VZEyKsawGmo47OV6QOHxTCx9URAZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-yerevan-ipv4

DNSCry.pt Yerevan - DNSCrypt, no filter, no logs, DNSSEC support (IPv4 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAADTg1LjkwLjIwNy4xOTkgk1VXqXvUtR3JLu9xcONFSHTVnBWEj2rWkjgjmv9iQSoZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscry.pt-yerevan-ipv6

DNSCry.pt Yerevan - DNSCrypt, no filter, no logs, DNSSEC support (IPv6 server)

https://www.dnscry.pt

sdns://AQcAAAAAAAAAGVsyYTAzOjkwYzA6NWYxOjI5MDM6OjUzOV0gk1VXqXvUtR3JLu9xcONFSHTVnBWEj2rWkjgjmv9iQSoZMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeS5wdA


## dnscrypt.ca-ipv4

Canadian based, unfiltered, DNSSEC validating, and no logs... for your pleasure. https://dnscrypt.ca/

sdns://AQcAAAAAAAAAEzE4NS4xMTEuMTg4LjQ2Ojg0NDMgC-tbTwd-08e_JtBJmgsvjAG9i10itE-LBNCwjTflezQiMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeXB0LmNhLTEtaXB2NA


## dnscrypt.ca-ipv4-doh

Canadian based, unfiltered, DNSSEC validating, and no logs... for your pleasure. https://dnscrypt.ca/

sdns://AgcAAAAAAAAADjE4NS4xMTEuMTg4LjQ2oMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVEGRuczEuZG5zY3J5cHQuY2EKL2Rucy1xdWVyeQ


## dnscrypt.uk-ipv4

DNSCrypt, no logs, uncensored, DNSSEC. Hosted in London UK on Digital Ocean
https://www.dnscrypt.uk

sdns://AQcAAAAAAAAADTE2NS4yMzIuMzIuOTUgAdMO6A4gTdoYcdOhDyhRVGdlvxS02kQEpP8EbX2paDwbMi5kbnNjcnlwdC1jZXJ0LmRuc2NyeXB0LnVr


## dnscrypt.uk-ipv6

DNSCrypt, no logs, uncensored, DNSSEC. Hosted in London UK on Digital Ocean
https://www.dnscrypt.uk

sdns://AQcAAAAAAAAAGlsyYTAzOmIwYzA6MTplMDo6NDg3OjEwMDFdIAHTDugOIE3aGHHToQ8oUVRnZb8UtNpEBKT_BG19qWg8GzIuZG5zY3J5cHQtY2VydC5kbnNjcnlwdC51aw


## doh-crypto-sx

DNS-over-HTTPS server. Anycast, no logs, no censorship, DNSSEC.
Globally cached via Cloudflare.
Maintained by Frank Denis.

sdns://AgcAAAAAAAAACzEwNC4yMS42Ljc4AA1kb2guY3J5cHRvLnN4Ci9kbnMtcXVlcnk
sdns://AgcAAAAAAAAADjE3Mi42Ny4xMzQuMTU3AA1kb2guY3J5cHRvLnN4Ci9kbnMtcXVlcnk


## doh-crypto-sx-ipv6

DNS-over-HTTPS server accessible over IPv6. Anycast, no logs, no censorship, DNSSEC.
Globally cached via Cloudflare.
Maintained by Frank Denis.

sdns://AgcAAAAAAAAAGlsyNjA2OjQ3MDA6MzAzNzo6NjgxNTo2NGVdABJkb2gtaXB2Ni5jcnlwdG8uc3gKL2Rucy1xdWVyeQ
sdns://AgcAAAAAAAAAG1syNjA2OjQ3MDA6MzAzNjo6YWM0Mzo4NjlkXQASZG9oLWlwdjYuY3J5cHRvLnN4Ci9kbnMtcXVlcnk


## doh.appliedprivacy.net

Public DoH resolver operated by the Foundation for Applied Privacy (https://appliedprivacy.net).
Hosted in Vienna, Austria.

Non-logging, non-filtering, supports DNSSEC.

sdns://AgcAAAAAAAAAAKDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRZkb2guYXBwbGllZHByaXZhY3kubmV0Bi9xdWVyeQ


## doh.ffmuc.net

An open (non-logging, non-filtering, non-censoring) DoH resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AgcAAAAAAAAACjUuMS42Ni4yNTWgzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1UNZG9oLmZmbXVjLm5ldAovZG5zLXF1ZXJ5


## doh.ffmuc.net-2

An open (non-logging, non-filtering, non-censoring) DoH resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AgcAAAAAAAAADjE4NS4xNTAuOTkuMjU1oMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVDWRvaC5mZm11Yy5uZXQKL2Rucy1xdWVyeQ


## doh.ffmuc.net-v6

An open (non-logging, non-filtering, non-censoring) DoH resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AgcAAAAAAAAAFVsyMDAxOjY3ODplNjg6ZjAwMDo6XaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQ1kb2guZmZtdWMubmV0Ci9kbnMtcXVlcnk


## doh.ffmuc.net-v6-2

An open (non-logging, non-filtering, non-censoring) DoH resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AgcAAAAAAAAAFVsyMDAxOjY3ODplZDA6ZjAwMDo6XaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQ1kb2guZmZtdWMubmV0Ci9kbnMtcXVlcnk


## faelix-ch-ipv4

An open (non-logging, non-filtering, no ECS) DNSCrypt resolver operated by https://faelix.net/ with IPv4 nodes anycast within AS41495 in Switzerland.

sdns://AQYAAAAAAAAAEzE4NS4xMzQuMTk2LjU1Ojg0NDMgfsvvPi8BgDKNYODh0ewj5Oh32OoJoZNwGgTWs8C-i-EfMi5kbnNjcnlwdC1jZXJ0LnJkbnMuZmFlbGl4Lm5ldA


## faelix-uk-ipv4

An open (non-logging, non-filtering, no ECS) DNSCrypt resolver operated by https://faelix.net/ with IPv4 nodes anycast within AS41495 in the UK.

sdns://AQYAAAAAAAAAEjQ2LjIyNy4yMDAuNTQ6ODQ0MyB-y-8-LwGAMo1g4OHR7CPk6HfY6gmhk3AaBNazwL6L4R8yLmRuc2NyeXB0LWNlcnQucmRucy5mYWVsaXgubmV0


## faelix-uk-ipv6

An open (non-logging, non-filtering, no ECS) DNSCrypt resolver operated by https://faelix.net/ with IPv6 nodes anycast within AS41495 in the UK.

sdns://AQYAAAAAAAAAFFsyYTAxOjllMDA6OjU0XTo4NDQzIH7L7z4vAYAyjWDg4dHsI-Tod9jqCaGTcBoE1rPAvovhHzIuZG5zY3J5cHQtY2VydC5yZG5zLmZhZWxpeC5uZXQ
sdns://AQYAAAAAAAAAFFsyYTAxOjllMDA6OjU1XTo4NDQzIH7L7z4vAYAyjWDg4dHsI-Tod9jqCaGTcBoE1rPAvovhHzIuZG5zY3J5cHQtY2VydC5yZG5zLmZhZWxpeC5uZXQ


## fdn

DoH server in France operated by FDN - French Data Network (non-profit ISP)
https://www.fdn.fr/

sdns://AgcAAAAAAAAADDgwLjY3LjE2OS40MKDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQpuczEuZmRuLmZyCi9kbnMtcXVlcnk


## fdn-ipv6

DoH server in France operated by FDN - French Data Network (non-profit ISP)
https://www.fdn.fr/

sdns://AgcAAAAAAAAAElsyMDAxOjkxMDo4MDA6OjEyXaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQpuczAuZmRuLmZyCi9kbnMtcXVlcnk
sdns://AgcAAAAAAAAAElsyMDAxOjkxMDo4MDA6OjQwXaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQpuczEuZmRuLmZyCi9kbnMtcXVlcnk


## ffmuc.net

An open (non-logging, non-filtering, non-censoring) DNSCrypt resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AQcAAAAAAAAADzUuMS42Ni4yNTU6ODQ0MyAH0Hrxz9xdmXadPwJmkKcESWXCdCdseRyu9a7zuQxG-hkyLmRuc2NyeXB0LWNlcnQuZmZtdWMubmV0


## ffmuc.net-v6

An open (non-logging, non-filtering, non-censoring) DNSCrypt resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/

sdns://AQcAAAAAAAAAGlsyMDAxOjY3ODplNjg6ZjAwMDo6XTo4NDQzIAfQevHP3F2Zdp0_AmaQpwRJZcJ0J2x5HK71rvO5DEb6GTIuZG5zY3J5cHQtY2VydC5mZm11Yy5uZXQ


## jp.tiar.app

Non-Logging, Non-Filtering DNSCrypt server in Japan.
No ECS, Support DNSSEC

sdns://AQcAAAAAAAAAEjE3Mi4xMDQuOTMuODA6MTQ0MyAyuHY-8b9lNqHeahPAzW9IoXnjiLaZpTeNbVs8TN9UUxsyLmRuc2NyeXB0LWNlcnQuanAudGlhci5hcHA


## jp.tiar.app-doh

Non-Logging, Non-Filtering DNS-over-HTTPS server in Japan.
No ECS, Support DNSSEC

sdns://AgcAAAAAAAAADTE3Mi4xMDQuOTMuODCgzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1ULanAudGlhci5hcHAKL2Rucy1xdWVyeQ


## jp.tiar.app-doh-ipv6

Non-Logging, Non-Filtering DNS-over-HTTPS (IPv6) server in Japan.
No ECS, Support DNSSEC

sdns://AgcAAAAAAAAAIFsyNDAwOjg5MDI6OmYwM2M6OTFmZjpmZWRhOmM1MTRdoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVC2pwLnRpYXIuYXBwCi9kbnMtcXVlcnk


## jp.tiar.app-ipv6

Non-Logging, Non-Filtering DNSCrypt (IPv6) server in Japan.
No ECS, Support DNSSEC

sdns://AQcAAAAAAAAAJVsyNDAwOjg5MDI6OmYwM2M6OTFmZjpmZWRhOmM1MTRdOjE0NDMgMrh2PvG_ZTah3moTwM1vSKF544i2maU3jW1bPEzfVFMbMi5kbnNjcnlwdC1jZXJ0LmpwLnRpYXIuYXBw


## jp.tiarap.org

DNS-over-HTTPS Server. Non-Logging, Non-Filtering, No ECS, Support DNSSEC.
Cached via Cloudflare.

sdns://AgcAAAAAAAAAAAANanAudGlhcmFwLm9yZwovZG5zLXF1ZXJ5


## jp.tiarap.org-ipv6

DNS-over-HTTPS Server (IPv6). Non-Logging, Non-Filtering, No ECS, Support DNSSEC.
Cached via Cloudflare.

sdns://AgcAAAAAAAAAG1syNjA2OjQ3MDA6MzAzMDo6YWM0MzphZDNiXQANanAudGlhcmFwLm9yZwovZG5zLXF1ZXJ5


## ksol.io-ns2-dnscrypt-ipv4

DNSCrypt on IPv4 (UDP/TCP). No DoH, doesn't log, doesn't filter, DNSSEC enforced. No EDNS Client-Subnet, padding enabled, as per `dnscrypt-server-docker` default unbound configuration. Location: Hungary

sdns://AQcAAAAAAAAADjE5My4yMDEuMTg4LjQ4IBERKdQJgLSjqCSK99e2f_WRTQzEq9__DeXlQFvxxhZ6GzIuZG5zY3J5cHQtY2VydC5uczIua3NvbC5pbw


## ksol.io-ns2-dnscrypt-ipv6

DNSCrypt on IPv6 (UDP/TCP). No DoH, doesn't log, doesn't filter, DNSSEC enforced. No EDNS Client-Subnet, padding enabled, as per `dnscrypt-server-docker` default unbound configuration. Location: Hungary

sdns://AQcAAAAAAAAAFFsyYTAxOjZlZTA6MTo6MjQxOjFdIBERKdQJgLSjqCSK99e2f_WRTQzEq9__DeXlQFvxxhZ6GzIuZG5zY3J5cHQtY2VydC5uczIua3NvbC5pbw


## mullvad-doh

Public non-filtering, non-logging (audited), DNSSEC-capable, DNS-over-HTTPS resolver hosted by VPN provider Mullvad.
Anycast IPv4/IPv6 with servers in SE, DE, UK, US, AU, and SG.
https://mullvad.net/en/help/dns-over-https-and-dns-over-tls/

sdns://AgcAAAAAAAAACzE5NC4yNDIuMi4yAA9kbnMubXVsbHZhZC5uZXQKL2Rucy1xdWVyeQ


## nextdns

NextDNS is a cloud-based private DNS service that gives you full control
over what is allowed and what is blocked on the Internet.

DNSSEC, Anycast, Non-logging, NoFilters

https://www.nextdns.io/

sdns://AgcAAAAAAAAACjQ1LjkwLjMwLjAgmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkWYW55Y2FzdC5kbnMubmV4dGRucy5pbwovZG5zLXF1ZXJ5


## nextdns-ipv6

Connects to NextDNS over IPv6.

NextDNS is a cloud-based private DNS service that gives you full control
over what is allowed and what is blocked on the Internet.

DNSSEC, Anycast, Non-logging, NoFilters

https://www.nextdns.io/

sdns://AgcAAAAAAAAADVsyYTA3OmE4YzA6Ol0gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkWYW55Y2FzdC5kbnMubmV4dGRucy5pbwovZG5zLXF1ZXJ5


## nextdns-ultralow

NextDNS is a cloud-based private DNS service that gives you full control
over what is allowed and what is blocked on the Internet.

https://www.nextdns.io/

To select the server location, the "-ultralow" variant relies on bootstrap servers
instead of anycast.

sdns://AgcAAAAAAAAAACCaOjT3J965vKUQA9nOnDn48n3ZxSQpAcK6saROY1oCGQ5kbnMubmV4dGRucy5pbw8vZG5zY3J5cHQtcHJveHk


## nic.cz

Open, DNSSEC, No-log and No-filter DoH operated by https://nic.cz

sdns://AgcAAAAAAAAADDE4NS40My4xMzUuMaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQtvZHZyLm5pYy5jegovZG5zLXF1ZXJ5
sdns://AgcAAAAAAAAACzE5My4xNy40Ny4xoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVC29kdnIubmljLmN6Ci9kbnMtcXVlcnk


## nic.cz-ipv6

Open, DNSSEC, No-log and No-filter DoH over IPv6 operated by https://nic.cz

sdns://AgcAAAAAAAAAE1syMDAxOjE0OGY6ZmZmZTo6MV2gzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1ULb2R2ci5uaWMuY3oKL2Rucy1xdWVyeQ
sdns://AgcAAAAAAAAAE1syMDAxOjE0OGY6ZmZmZjo6MV2gzBBg05yDKbYrb7x9DW35MJhpuYHn5jktXNj6QI9NgOag9_WvKIAeh31986K-KP4UnzJ0p-0p8Tb9UDzjmMuoCw2gs14FlQz72CWfk3W6EBhwuMPEwOxaUpdX5jFn6d4mqeigRE69Z7uD-IB7OSHpOKyReLiCvVCq2xEjHwRM9fCN986g5kS6aWPjNf52XLmXaxKxDrVClLQkd3ZMyzo6zKOssvwgKq4_t78F5MgcQZTcpEUR1PmvMEeG7BrnIYQJz2Kgg1ULb2R2ci5uaWMuY3oKL2Rucy1xdWVyeQ


## njalla-doh

Non-logging DoH server in Sweden operated by Njalla.

https://dns.njal.la/

sdns://AgcAAAAAAAAADDk1LjIxNS4xOS41M6DMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVQtkbnMubmphbC5sYQovZG5zLXF1ZXJ5


## plan9dns-fl

Miami Florida, USA. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAAEzE0OS4yOC4xMDEuMTE5Ojg0NDMgVaFV4a8StIfx8fnCxDxVlxppqm-hJYyCKqtMtQENnCwkMi5kbnNjcnlwdC1jZXJ0LnBsdXRvbi5wbGFuOS1kbnMuY29t


## plan9dns-fl-doh

Miami Florida, USA. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAADjE0OS4yOC4xMDEuMTE5IJo6NPcn3rm8pRAD2c6cOfjyfdnFJCkBwrqxpE5jWgIZFHBsdXRvbi5wbGFuOS1kbnMuY29tCi9kbnMtcXVlcnk


## plan9dns-fl-doh-ipv6

Miami Florida, USA. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAAJ1syMDAxOjE5ZjA6OTAwMjpkZTQ6NTQwMDo0ZmY6ZmUwODo3ZGUzXSCaOjT3J965vKUQA9nOnDn48n3ZxSQpAcK6saROY1oCGRRwbHV0b24ucGxhbjktZG5zLmNvbQovZG5zLXF1ZXJ5


## plan9dns-fl-ipv6

Miami Florida, USA. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAALFsyMDAxOjE5ZjA6OTAwMjpkZTQ6NTQwMDo0ZmY6ZmUwODo3ZGUzXTo4NDQzIFWhVeGvErSH8fH5wsQ8VZcaaapvoSWMgiqrTLUBDZwsJDIuZG5zY3J5cHQtY2VydC5wbHV0b24ucGxhbjktZG5zLmNvbQ


## plan9dns-mx

Mexico City, MX. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAAEzIxNi4yMzguODAuMjE5Ojg0NDMgKmPCui35rtOj9yk7c07sEtC_Khyo_9_HcpO23GCroNskMi5kbnNjcnlwdC1jZXJ0LmhlbGlvcy5wbGFuOS1kbnMuY29t


## plan9dns-mx-doh

Mexico City, MX. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAADjIxNi4yMzguODAuMjE5IJo6NPcn3rm8pRAD2c6cOfjyfdnFJCkBwrqxpE5jWgIZFGhlbGlvcy5wbGFuOS1kbnMuY29tCi9kbnMtcXVlcnk


## plan9dns-mx-doh-ipv6

Mexico City, MX. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAAKFsyMDAxOjE5ZjA6YjQwMDoxZDhjOjU0MDA6NGZmOmZlMTE6YjE1YV0gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUaGVsaW9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ


## plan9dns-mx-ipv6

Mexico City, MX. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAALVsyMDAxOjE5ZjA6YjQwMDoxZDhjOjU0MDA6NGZmOmZlMTE6YjE1YV06ODQ0MyAqY8K6Lfmu06P3KTtzTuwS0L8qHKj_38dyk7bcYKug2yQyLmRuc2NyeXB0LWNlcnQuaGVsaW9zLnBsYW45LWRucy5jb20


## plan9dns-nj

Piscataway New Jersey, USA. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAAEjIwNy4yNDYuODcuOTY6ODQ0MyCwmQlIDpKk8SiiyrJbPgKhHxCrBJLb8ZWlu6tvr1KvkyQyLmRuc2NyeXB0LWNlcnQua3Jvbm9zLnBsYW45LWRucy5jb20


## plan9dns-nj-doh

Piscataway New Jersey, USA. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAADTIwNy4yNDYuODcuOTYgmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUa3Jvbm9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ


## plan9dns-nj-doh-ipv6

Piscataway New Jersey, USA. DoH, DoH3 via the Alt-Svc header, no-logs, no-filters, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns, DoT & DoQ supported.

sdns://AgcAAAAAAAAAJVsyMDAxOjE5ZjA6NTozYmQ3OjU0MDA6NGZmOmZlMDU6ZGE4M10gmjo09yfeubylEAPZzpw5-PJ92cUkKQHCurGkTmNaAhkUa3Jvbm9zLnBsYW45LWRucy5jb20KL2Rucy1xdWVyeQ


## plan9dns-nj.ipv6

Piscataway New Jersey, USA. DNSCrypt, no filters, no logs, DNSSEC

Hosted on Vultr, jlongua.github.io/plan9-dns

sdns://AQcAAAAAAAAAKlsyMDAxOjE5ZjA6NTozYmQ3OjU0MDA6NGZmOmZlMDU6ZGE4M106ODQ0MyCwmQlIDpKk8SiiyrJbPgKhHxCrBJLb8ZWlu6tvr1KvkyQyLmRuc2NyeXB0LWNlcnQua3Jvbm9zLnBsYW45LWRucy5jb20


## quad101

DNSSEC-aware public resolver by the Taiwan Network Information Center (TWNIC)
https://101.101.101.101/index_en.html

sdns://AgcAAAAAAAAAACC2vD25TAYM7EnyCH8Xw1-0g5OccnTsGH9vQUUH0njRtAxkbnMudHduaWMudHcKL2Rucy1xdWVyeQ


## quad9-dnscrypt-ip4-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 9.9.9.12 - 149.112.112.12

sdns://AQYAAAAAAAAADTkuOS45LjEyOjg0NDMgZ8hHuMh1jNEgJFVDvnVnRt803x2EwAuMRwNo34Idhj4ZMi5kbnNjcnlwdC1jZXJ0LnF1YWQ5Lm5ldA
sdns://AQYAAAAAAAAAEzE0OS4xMTIuMTEyLjEyOjg0NDMgZ8hHuMh1jNEgJFVDvnVnRt803x2EwAuMRwNo34Idhj4ZMi5kbnNjcnlwdC1jZXJ0LnF1YWQ5Lm5ldA


## quad9-dnscrypt-ip4-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 9.9.9.10 - 149.112.112.10

sdns://AQYAAAAAAAAADTkuOS45LjEwOjg0NDMgZ8hHuMh1jNEgJFVDvnVnRt803x2EwAuMRwNo34Idhj4ZMi5kbnNjcnlwdC1jZXJ0LnF1YWQ5Lm5ldA
sdns://AQYAAAAAAAAAEzE0OS4xMTIuMTEyLjEwOjg0NDMgZ8hHuMh1jNEgJFVDvnVnRt803x2EwAuMRwNo34Idhj4ZMi5kbnNjcnlwdC1jZXJ0LnF1YWQ5Lm5ldA


## quad9-dnscrypt-ip6-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 2620:fe::12 - 2620:fe::fe:12

sdns://AQYAAAAAAAAAElsyNjIwOmZlOjoxMl06ODQ0MyBnyEe4yHWM0SAkVUO-dWdG3zTfHYTAC4xHA2jfgh2GPhkyLmRuc2NyeXB0LWNlcnQucXVhZDkubmV0
sdns://AQYAAAAAAAAAFVsyNjIwOmZlOjpmZToxMl06ODQ0MyBnyEe4yHWM0SAkVUO-dWdG3zTfHYTAC4xHA2jfgh2GPhkyLmRuc2NyeXB0LWNlcnQucXVhZDkubmV0


## quad9-dnscrypt-ip6-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 2620:fe::10 - 2620:fe::fe:10

sdns://AQYAAAAAAAAAElsyNjIwOmZlOjoxMF06ODQ0MyBnyEe4yHWM0SAkVUO-dWdG3zTfHYTAC4xHA2jfgh2GPhkyLmRuc2NyeXB0LWNlcnQucXVhZDkubmV0
sdns://AQYAAAAAAAAAFVsyNjIwOmZlOjpmZToxMF06ODQ0MyBnyEe4yHWM0SAkVUO-dWdG3zTfHYTAC4xHA2jfgh2GPhkyLmRuc2NyeXB0LWNlcnQucXVhZDkubmV0


## quad9-doh-ip4-port443-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 9.9.9.12 - 149.112.112.12

sdns://AgYAAAAAAAAACDkuOS45LjEyILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvE2RuczEyLnF1YWQ5Lm5ldDo0NDMKL2Rucy1xdWVyeQ
sdns://AgYAAAAAAAAADjE0OS4xMTIuMTEyLjEyILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvE2RuczEyLnF1YWQ5Lm5ldDo0NDMKL2Rucy1xdWVyeQ


## quad9-doh-ip4-port443-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 9.9.9.10 - 149.112.112.10

sdns://AgYAAAAAAAAACDkuOS45LjEwILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvE2RuczEwLnF1YWQ5Lm5ldDo0NDMKL2Rucy1xdWVyeQ
sdns://AgYAAAAAAAAADjE0OS4xMTIuMTEyLjEwILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvE2RuczEwLnF1YWQ5Lm5ldDo0NDMKL2Rucy1xdWVyeQ


## quad9-doh-ip4-port5053-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 9.9.9.12 - 149.112.112.12

sdns://AgYAAAAAAAAACDkuOS45LjEyILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvFGRuczEyLnF1YWQ5Lm5ldDo1MDUzCi9kbnMtcXVlcnk
sdns://AgYAAAAAAAAADjE0OS4xMTIuMTEyLjEyILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvFGRuczEyLnF1YWQ5Lm5ldDo1MDUzCi9kbnMtcXVlcnk


## quad9-doh-ip4-port5053-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 9.9.9.10 - 149.112.112.10

sdns://AgYAAAAAAAAACDkuOS45LjEwILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvFGRuczEwLnF1YWQ5Lm5ldDo1MDUzCi9kbnMtcXVlcnk
sdns://AgYAAAAAAAAADjE0OS4xMTIuMTEyLjEwILAZIHRLu3bJqwU-AeB7fgUORz0g95976kNfr-Q8nSQvFGRuczEwLnF1YWQ5Lm5ldDo1MDUzCi9kbnMtcXVlcnk


## quad9-doh-ip6-port443-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 2620:fe::12 - 2620:fe::fe:12

sdns://AgYAAAAAAAAADVsyNjIwOmZlOjoxMl0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8TZG5zMTIucXVhZDkubmV0OjQ0MwovZG5zLXF1ZXJ5
sdns://AgYAAAAAAAAAEFsyNjIwOmZlOjpmZToxMl0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8TZG5zMTIucXVhZDkubmV0OjQ0MwovZG5zLXF1ZXJ5


## quad9-doh-ip6-port443-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 2620:fe::10 - 2620:fe::fe:10

sdns://AgYAAAAAAAAADVsyNjIwOmZlOjoxMF0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8TZG5zMTAucXVhZDkubmV0OjQ0MwovZG5zLXF1ZXJ5
sdns://AgYAAAAAAAAAEFsyNjIwOmZlOjpmZToxMF0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8TZG5zMTAucXVhZDkubmV0OjQ0MwovZG5zLXF1ZXJ5


## quad9-doh-ip6-port5053-nofilter-ecs-pri

Quad9 (anycast) no-dnssec/no-log/no-filter/ecs 2620:fe::12 - 2620:fe::fe:12

sdns://AgYAAAAAAAAADVsyNjIwOmZlOjoxMl0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8UZG5zMTIucXVhZDkubmV0OjUwNTMKL2Rucy1xdWVyeQ
sdns://AgYAAAAAAAAAEFsyNjIwOmZlOjpmZToxMl0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8UZG5zMTIucXVhZDkubmV0OjUwNTMKL2Rucy1xdWVyeQ


## quad9-doh-ip6-port5053-nofilter-pri

Quad9 (anycast) no-dnssec/no-log/no-filter 2620:fe::10 - 2620:fe::fe:10

sdns://AgYAAAAAAAAADVsyNjIwOmZlOjoxMF0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8UZG5zMTAucXVhZDkubmV0OjUwNTMKL2Rucy1xdWVyeQ
sdns://AgYAAAAAAAAAEFsyNjIwOmZlOjpmZToxMF0gsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8UZG5zMTAucXVhZDkubmV0OjUwNTMKL2Rucy1xdWVyeQ


## restena-doh-ipv4

DNSSEC, No-log and No-filter DoH operated by RESTENA. Homepage: https://www.restena.lu

sdns://AgcAAAAAAAAACzE1OC42NC4xLjI5IGDJBNhGNSOSEa34Gom8fB_myqDD7-nW-TeU7KcLNV6oEWRuc3B1Yi5yZXN0ZW5hLmx1Ci9kbnMtcXVlcnk


## restena-doh-ipv6

DNSSEC, No-log and No-filter DoH (IPv6) operated by RESTENA. Homepage: https://www.restena.lu

sdns://AgcAAAAAAAAAEFsyMDAxOmExODoxOjoyOV0gYMkE2EY1I5IRrfgaibx8H-bKoMPv6db5N5Tspws1XqgRZG5zcHViLnJlc3RlbmEubHUKL2Rucy1xdWVyeQ


## scaleway-ams

DNSSEC/Non-logged/Uncensored in Amsterdam - DEV1-S instance donated by Scaleway.com
Maintained by Frank Denis - https://fr.dnscrypt.info

sdns://AQcAAAAAAAAADTUxLjE1LjEyMi4yNTAg6Q3ZfapcbHgiHKLF7QFoli0Ty1Vsz3RXs1RUbxUrwZAcMi5kbnNjcnlwdC1jZXJ0LnNjYWxld2F5LWFtcw


## scaleway-ams-ipv6

DNSSEC/Non-logged/Uncensored in Amsterdam - IPv6 only - DEV1-S instance donated by Scaleway.com
Maintained by Frank Denis - https://fr.dnscrypt.info

sdns://AQcAAAAAAAAAJlsyMDAxOmJjODoxNjQwOjFjZTI6ZGMwMDpmZjpmZTI4OjViMTddIOkN2X2qXGx4Ihyixe0BaJYtE8tVbM90V7NUVG8VK8GQHDIuZG5zY3J5cHQtY2VydC5zY2FsZXdheS1hbXM


## uncensoreddns-dk-ipv4

Also known as censurfridns.
DoH, no logs, no filter, unicast hosted in Denmark - https://blog.uncensoreddns.org

sdns://AgYAAAAAAAAADDg5LjIzMy40My43MaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRl1bmljYXN0LnVuY2Vuc29yZWRkbnMub3JnCi9kbnMtcXVlcnk


## uncensoreddns-dk-ipv6

Also known as censurfridns.
DoH, no logs, no filter, unicast hosted in Denmark - https://blog.uncensoreddns.org

sdns://AgYAAAAAAAAAElsyYTAxOjNhMDo1Mzo1Mzo6XaDMEGDTnIMptitvvH0NbfkwmGm5gefmOS1c2PpAj02A5qD39a8ogB6HfX3zor4o_hSfMnSn7SnxNv1QPOOYy6gLDaCzXgWVDPvYJZ-TdboQGHC4w8TA7FpSl1fmMWfp3iap6KBETr1nu4P4gHs5Iek4rJF4uIK9UKrbESMfBEz18I33zqDmRLppY-M1_nZcuZdrErEOtUKUtCR3dkzLOjrMo6yy_CAqrj-3vwXkyBxBlNykRRHU-a8wR4bsGuchhAnPYqCDVRl1bmljYXN0LnVuY2Vuc29yZWRkbnMub3JnCi9kbnMtcXVlcnk


## uncensoreddns-ipv4

Also known as censurfridns.
DoH, no logs, no filter, anycast - https://blog.uncensoreddns.org

sdns://AgYAAAAAAAAADjkxLjIzOS4xMDAuMTAwoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVGWFueWNhc3QudW5jZW5zb3JlZGRucy5vcmcKL2Rucy1xdWVyeQ


## uncensoreddns-ipv6

Also known as censurfridns.
DoH, no logs, no filter, anycast - https://blog.uncensoreddns.org

sdns://AgYAAAAAAAAAEVsyMDAxOjY3YzoyOGE0OjpdoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVGWFueWNhc3QudW5jZW5zb3JlZGRucy5vcmcKL2Rucy1xdWVyeQ


## v.dnscrypt.uk-ipv4

DNSCrypt, no logs, uncensored, DNSSEC. Hosted in London UK on Digital Ocean
https://www.dnscrypt.uk

sdns://AQcAAAAAAAAADzEwNC4yMzguMTg2LjE5MiDtST2M6teQZk8GPEe3lZojaS18kDY8nkPMtZF75bQe5R0yLmRuc2NyeXB0LWNlcnQudi5kbnNjcnlwdC51aw


## v.dnscrypt.uk-ipv6

DNSCrypt, no logs, uncensored, DNSSEC. Hosted in London UK on Digital Ocean
https://www.dnscrypt.uk

sdns://AQcAAAAAAAAAKFsyMDAxOjE5ZjA6NzQwMjoxNTc0OjU0MDA6MmZmOmZlNjY6MmNmZl0g7Uk9jOrXkGZPBjxHt5WaI2ktfJA2PJ5DzLWRe-W0HuUdMi5kbnNjcnlwdC1jZXJ0LnYuZG5zY3J5cHQudWs


## wikimedia

Wikimedia DNS (formerly called Wikidough), is a caching, recursive,
public resolver service that is run and managed by the Site
Reliability Engineering (Traffic) team at the Foundation.

Wikimedia DNS helps prevent some surveillance and censorship of our
wikis and other websites by securing DNS lookups.

DoH. DNSSEC. No filter. No logs.

sdns://AgcAAAAAAAAADjE4NS43MS4xMzguMTM4oMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVEXdpa2ltZWRpYS1kbnMub3JnCi9kbnMtcXVlcnk


## wikimedia-ipv6

Wikimedia DNS over IPv6.

Wikimedia DNS (formerly called Wikidough), is a caching, recursive,
public resolver service that is run and managed by the Site
Reliability Engineering (Traffic) team at the Foundation.

Wikimedia DNS helps prevent some surveillance and censorship of our
wikis and other websites by securing DNS lookups.

DoH. DNSSEC. No filter. No logs.

sdns://AgcAAAAAAAAAEVsyMDAxOjY3Yzo5MzA6OjFdoMwQYNOcgym2K2-8fQ1t-TCYabmB5-Y5LVzY-kCPTYDmoPf1ryiAHod9ffOivij-FJ8ydKftKfE2_VA845jLqAsNoLNeBZUM-9gln5N1uhAYcLjDxMDsWlKXV-YxZ-neJqnooEROvWe7g_iAezkh6TiskXi4gr1QqtsRIx8ETPXwjffOoOZEumlj4zX-dly5l2sSsQ61QpS0JHd2TMs6OsyjrLL8ICquP7e_BeTIHEGU3KRFEdT5rzBHhuwa5yGECc9ioINVEXdpa2ltZWRpYS1kbnMub3JnCi9kbnMtcXVlcnk
