FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential vim sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS final
# RUN useradd -m root && echo "root:root" | chpasswd && adduser root sudo
USER root
# WORKDIR /home/root
WORKDIR /root

FROM final
COPY . .
CMD ["echo", "Hello World!"]

