FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y sudo bash curl apt-utils iputils-ping \
    vim nano net-tools wget gnupg2 ca-certificates \
    python3 python3-pip software-properties-common

# Add a user who can sudo with no password
RUN useradd -ms /bin/bash intern && \
    echo "intern ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER intern
WORKDIR /home/intern

COPY start.sh game.sh ./
RUN chmod +x start.sh game.sh

ENTRYPOINT ["./start.sh"]
