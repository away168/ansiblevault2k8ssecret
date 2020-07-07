# Ansible Vault to K8s Secret
Take an encrypted ansible vault file and turn it into a k8s secret - using a run job aka `kind:job`

## Description
The goal is to demonstrate in Spinnaker the ability to read in an Ansible Vault secret and deploy the secret to K8s as a kind:secret

Using a docker container that contains the Ansible CLI and K8s CLI

Run the container as a job in k8s, with the prerequisite files mounted

We also need to setup a ServiceAccount with permissions to create Secrets.

---
commands
`ansible-vault encrypt --vault-password-file [passwd] [file to encrypt] --output [encrypted filename]`
`ansible-vault decrypt --vault-password-file [passwd] [file to decrypt] --output [decrypted filename]`

---

Notes: 
* the password file should be added as a k8s secret ahead of time by the ansible vault admin.
* this will be mounted as part of the job

