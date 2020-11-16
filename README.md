# Self signed certificate GitHub action

[![GitHub Releases](https://img.shields.io/github/v/release/kofemann/action-create-certificate.svg)](https://github.com/kofemann/action-create-certificate/releases)

This action generates a self-signed certificate that can be used
during test phase.

## Inputs

### `hostcert`

- **Required** The file where to store the certificate. Defaults to `hostcert.pem`

### `hostkey`

- **Required** The file where to store the host key. Defaults to `hostkey.pem`

### `cachain`

- **Required** The file where to store CA chain. Defaults to `ca-chain.pem`

```yaml
name: test with self signed certificate
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Generate certificates for next step
        uses: kofemann/action-create-certificate@v0.0.4

        with:
          hostcert: 'hostcert.pem'
          hostkey:  'hostkey.pem'
          cachain:  'ca-chain.pem'

      - name: Use generated certificates
        run: |
            openssl x509 -in hostcert.pem -noout -text
```

## Acknowledgement

This work is based on [Nick Sullivan, Cloudflare](https://blog.cloudflare.com/how-to-build-your-own-public-key-infrastructure/) and [Johannes Tegnér](https://jite.eu/2019/2/6/ca-with-cfssl/) blog posts.

## License

Licensed under BSD 2-Clause “Simplified” License
