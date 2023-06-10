FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential vim sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS final
RUN sudo adduser solomon
RUN sudo usermod -aG sudo solomon
RUN echo "solomon:mypass" | chpasswd
WORKDIR /home/solomon/.dotfiles

FROM final
COPY . .

# Switch to root to change ownership of the .dotfiles directory
USER root
RUN sudo chown -R solomon:solomon /home/solomon/.dotfiles/
USER solomon

CMD ["echo", "Hello World!"]