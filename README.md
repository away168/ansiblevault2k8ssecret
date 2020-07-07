# Ansible Vault to K8s Secret
Take an encrypted ansible vault file and turn it into a k8s secret - using a run job aka `kind:job`

## Description
The goal is to demonstrate in Spinnaker the ability to read in an Ansible Vault secret and deploy the secret to K8s as a kind:secret

Using a docker container that contains the Ansible CLI and K8s CLI

Run the container as a job in k8s, with the prerequisite files mounted

We also need to setup a ServiceAccount with permissions to create Secrets.


## Usage
Run the manifests/job.yaml as an example of a spinnaker run job stage. 
Specify the arguments either based on SpEL (pipeline expressions) such as k8s secret name and namespace.

First, you will need to create a secret that contains the password for ansible vault. This secret will get mounted as a password file for the `ansible-vault` cli.

Next, you will need to reference the encrypted file also as a k8s secret.  This can be created from an artifact file. 

Apply the manifests/ansiblehelper.yaml which creates a role (to allow for creation of secrets), a service account, ansiblehelper, and a clusterrolebinding to bind the service account and role.

The service account, ansiblehelper, will be used by the job for it to create secrets.

## Considerations
Proper RBAC should be configured for the Spinnaker Account - such that only certain roles can have access to create secrets using the service account. 

---

## Misc

`ansible-vault encrypt --vault-password-file [passwd] [file to encrypt] --output [encrypted filename]`
`ansible-vault decrypt --vault-password-file [passwd] [file to decrypt] --output [decrypted filename]`

---

Notes: 
* the password file should be added as a k8s secret ahead of time by the ansible vault admin.
* this will be mounted as part of the job

