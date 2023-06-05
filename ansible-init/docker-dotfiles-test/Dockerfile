FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y software-properties-common curl git build-essential ansible vim sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS final
RUN useradd -m solomon && echo "solomon:mypass" | chpasswd && adduser solomon sudo
USER solomon
WORKDIR /home/solomon

FROM final
COPY . .
CMD ["echo", "Hello World!"]

