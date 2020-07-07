#!/bin/bash

# this script takes an encrypted ansible-vault file , decrypts it, and then saves it as a k8s secret

## ./saveSecret.sh /tmp/encryptedfile /tmp/passwordfile secretname dev
# First argument is the file to decrypt
# Second argument is the password file
# Third argument is the name of the secret to create
# Fourth argument is the namespace

set -x

ansible-vault decrypt $1 --vault-password-file $2 --output /tmp/file

kubectl create secret generic $3 --from-file=/tmp/file -n $4

rm /tmp/file