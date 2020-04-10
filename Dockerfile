FROM cfssl/cfssl:latest

RUN mkdir -p /opt/acc/etc /opt/acc/ca /opt/acc/out


COPY ca-csr.json /opt/acc/etc/ca-csr.json
COPY intermediate-csr.json /opt/acc/etc/intermediate-csr.json
COPY server-csr.json /opt/acc/etc/server-csr.json

COPY signing-ca-cert-config.json /opt/acc/etc/signing-ca-cert-config.json

COPY entrypoint.sh /entrypoint.sh



ENTRYPOINT ["/entrypoint.sh"]