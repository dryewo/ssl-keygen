# SSL key and certificate generator

Utilities to generate browser-compatible SSL certificates.

## Usage

### Generate CA certificate and add it to your keychain

First you need to generate your own CA:
```sh
$ ./gen-ca.sh "My personal CA I'm proud of"
```

The following files will be generated:

```
ca.key
ca.crt
```

This is usually done once. Then add the `ca.crt` file to your keychain and mark it as trusted. Doing this will make your browsers trust all the certificates issued under this CA.

### Generate SSL certificates

Then you can generate SSL certificates for specific hostnames:

```sh
$ ./gen-cert.sh localhost
```

The following files will be generated:

```
cert.key
cert.crt
```

You can use them to setup a reverse proxy server that terminates SSL.

### Set up nginx

## References

* http://datacenteroverlords.com/2012/03/01/creating-your-own-ssl-certificate-authority/
* https://www.openssl.org/docs/apps/openssl.html