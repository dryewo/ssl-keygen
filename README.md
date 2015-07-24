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

Put `cert.key` and `cert.crt` onto the machine running nginx and provide the following `nginx.conf` (replace `localhost:8080` with actual backend address and `8443` with actual SSL port):

```
events {
}

http {
  server {
    listen 8443;

    ssl on;
    ssl_certificate /ssl/cert.crt;
    ssl_certificate_key /ssl/cert.key;

    location / {
      proxy_pass http://localhost:8080;
    }
  }
}
```

## License

Copyright 2015 Zalando SE

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## References

* http://datacenteroverlords.com/2012/03/01/creating-your-own-ssl-certificate-authority/
* https://www.openssl.org/docs/apps/openssl.html
