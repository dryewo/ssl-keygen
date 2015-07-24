#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

# Usage:
#   ./gen-cert.sh localhost
# Input:
#   * ca.key
#   * ca.crt
# Output:
#   * cert.key
#   * cert.crt
# Generates cert.key and cert.crt files for a specified domain name

HOSTNAME=$1

echo Generating SSL certificate for "$HOSTNAME"

openssl genrsa -out cert.key 4096
# Use piping to avoid *.csr file creation
openssl req -new -key cert.key -subj "/CN=$HOSTNAME" \
    | openssl x509 -req -sha256 -days 36526 -CA ca.crt -CAkey ca.key -set_serial 01 -out cert.crt -extensions v3_req

