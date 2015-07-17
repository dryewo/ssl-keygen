#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

# Usage:
#   ./gen-ca.sh "My certificate CA"
# Output:
#   * ca.key
#   * ca.crt
# Generates ca.key and ca.crt files in the current dir, using the provided name for  the certificate

NAME="${1:-Very dangerous unknown debug root CA}"

openssl genrsa -out ca.key 4096
openssl req -new -x509 -sha256 -days 36526 -key ca.key -subj "/CN=$NAME" -out ca.crt

