# mtls

This repository provides a script to generate a Certificate Authority and client certificates.

## Thanks

Based on the amazing
article [How to Create CA Certificate](https://www.golinuxcloud.com/mutual-tls-authentication-mtls/#5_Create_CA_certificate)
.

## Usage

Script was built initially to run local tests.

Want to use in production? Go ahead.

## How to use

### OpenSSL

First of all verify if you have openssl installed

```shell
openssl version
```

If not, you have to install it.

### Run

Clone or fork this repo

run

```shell
chmod +x generate_mtls_cert.sh
```

after

```shell
./generate_mtls_cert
```

## Anything wrong or want an improvement?

Feel free to open a PR or an Issue.

# BE HAPPY 