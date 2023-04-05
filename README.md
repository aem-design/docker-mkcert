## Make Cert

[![build_status](https://github.com/aem-design/docker-mkcert/workflows/build/badge.svg)](https://github.com/aem-design/docker-mkcert/actions?query=workflow%3Abuild)
[![github license](https://img.shields.io/github/license/aem-design/docker-mkcert)](https://github.com/aem-design/docker-mkcert)
[![github issues](https://img.shields.io/github/issues/aem-design/docker-mkcert)](https://github.com/aem-design/docker-mkcert)
[![github last commit](https://img.shields.io/github/last-commit/aem-design/docker-mkcert)](https://github.com/aem-design/docker-mkcert)
[![github repo size](https://img.shields.io/github/repo-size/aem-design/docker-mkcert)](https://github.com/aem-design/docker-mkcert)
[![docker stars](https://img.shields.io/docker/stars/aemdesign/mkcert)](https://hub.docker.com/r/aemdesign/mkcert)
[![docker pulls](https://img.shields.io/docker/pulls/aemdesign/mkcert)](https://hub.docker.com/r/aemdesign/mkcert)

A fast and simple way to generate CA and SSL certificates for your local dev environment

## How to run

To create certificate with pkcs12 in your current directory:

```bash
docker run -v $PWD:/root/.local/share/mkcert brunopadz/mkcert-docker:latest /bin/sh -c "mkcert -install && mkcert -cert-file mkcert.pem -key-file mkcert.key localhost.dev && openssl pkcs12 -export -out mkcert.pfx -in mkcert.pem -inkey mkcert.key -certfile rootCA.pem -passout pass:123;"
```

or

```powershell
docker run -v ${PWD}:/root/.local/share/mkcert brunopadz/mkcert-docker:latest /bin/sh -c "mkcert -install && mkcert -cert-file mkcert.pem -key-file mkcert.key localhost.dev && openssl pkcs12 -export -out mkcert.pfx -in mkcert.pem -inkey mkcert.key -certfile rootCA.pem -passout pass:123;"
```

