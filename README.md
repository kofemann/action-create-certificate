# Self signed certificate docker action

This action generates a self-signed certificate

## Inputs

### `hostcert`

**Required** The file where to store the certificate. Defaults to `hostcert.pem`

### `hostkey`

**Required** The file where to store the host key. Defaults to `hostkey.pem`

## Outputs



## Example usage

uses: actions/action-create-certificate@v1
with:
  hostcert: 'hostcert.pem'