#!/bin/bash

# this script takes an encrypted ansible-vault file , decrypts it, and then saves it as a k8s secret

# First argument is the file to decrypt
# Second argument is the password file
# Third argument is the name of the secret to create

ansible-vault decrypt ansible-vault decrypt $1 --vault-password-file $2 --output /tmp/file

kubectl create secret generic $3 --from-file=$1:/tmp/file