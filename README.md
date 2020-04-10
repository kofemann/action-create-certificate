# Self signed certificate docker action

This action generates a self-signed certificate that can be used
during test phase.

## Inputs

### `hostcert`

- **Required** The file where to store the certificate. Defaults to `hostcert.pem`

### `hostkey`

- **Required** The file where to store the host key. Defaults to `hostkey.pem`

### `cachain`

- **Required** The file where to store CA chain. Defaults to `ca-chain.pem`

```
uses: kofemann/action-create-certificate@v0.0.1
with:
  hostcert: 'hostcert.pem'
  hostkey:  'hostkey.pem'
  cachain: 'ca-chain.pem'
```
