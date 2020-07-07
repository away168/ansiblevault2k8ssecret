FROM ubuntu:18.04

ENV KUBECTL_RELEASE=1.16.8

# install ansible cli
RUN apt-get update && \ 
    apt-get install software-properties-common curl -y
RUN apt-add-repository --yes --update ppa:ansible/ansible && \ 
    apt-get install ansible -y

# install k8s cli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_RELEASE}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && ln -sv /usr/local/bin/kubectl /usr/local/bin/k

COPY scripts/saveSecret.sh /home/ubuntu/scripts/
RUN chmod 755 /home/ubuntu/scripts/saveSecret.sh

WORKDIR /home/ubuntu

ENTRYPOINT tail -f > /dev/null
# ENTRYPOINT saveSecret.sh