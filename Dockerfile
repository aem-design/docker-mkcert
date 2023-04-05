FROM alpine:latest

LABEL   maintainer="devops <devops@aem.design>" \
        version="1.0.0" \
        imagename="mkcert" \
        test.command=" mkcert --version" \
        test.command.verify="v1.4.4"

WORKDIR /

ENV CAROOT=/certs

RUN   apk update && \
      apk --no-cache add curl && \
      apk add --no-cache openssl && \
      curl -JLO "https://dl.filippo.io/mkcert/v1.4.4?for=linux/amd64" && \
      chmod +x mkcert-v1.4.4-linux-amd64 && \
      ln -s /mkcert-v1.4.4-linux-amd64 /bin/mkcert && \
      rm -rf /var/cache/apk/*

WORKDIR /certs

CMD ["mkcert"]
