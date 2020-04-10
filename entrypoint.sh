#!/bin/sh

ACC_HOME=/opt/acc
LOG=-loglevel=4

# Generate root-ca. The generated file are root-ca.pem and root-ca.key
cfssl genkey $LOG -initca ${ACC_HOME}/etc/ca-csr.json \
| cfssljson -bare ${ACC_HOME}/ca/root-ca


# Generate signing-ca. The generated file are signing-ca.pem, signing-ca.key and signing-ca.csr
cfssl gencert $LOG -ca ${ACC_HOME}/ca/root-ca.pem -ca-key ${ACC_HOME}/ca/root-ca-key.pem \
    -config="${ACC_HOME}/etc/signing-ca-cert-config.json" \
    -profile="intermediate" ${ACC_HOME}/etc/intermediate-csr.json | \
    cfssljson -bare ${ACC_HOME}/ca/signing-ca

# Generate server sertificate.
cfssl gencert $LOG -ca ${ACC_HOME}/ca/signing-ca.pem -ca-key ${ACC_HOME}/ca/signing-ca-key.pem \
    -config="${ACC_HOME}/etc/signing-ca-cert-config.json" \
    -profile="server" ${ACC_HOME}/etc/server-csr.json | \
    cfssljson -bare ${ACC_HOME}/out/host


# CA-cain
cat ${ACC_HOME}/ca/root-ca.pem ${ACC_HOME}/ca/signing-ca.pem > ${ACC_HOME}/out/ca-chain.pem

exec /bin/bash