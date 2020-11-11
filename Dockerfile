FROM alpine:latest

LABEL name="tor"
LABEL version="latest"

RUN apk update && \
  apk add tor && \
  chmod 700 /var/lib/tor && \
  rm -rf /var/cache/apk/*

COPY torrc /etc/tor/torrc

RUN chown -R tor /etc/tor

USER tor

EXPOSE 9050

ENTRYPOINT ["tor"]

CMD ["-f", "/etc/tor/torrc"]

