FROM ubuntu:rolling

ARG UNAME=user
ARG UID=1000
ARG GID=1000

USER root

RUN mkdir /home/$UNAME && \
    groupadd -g $GID -o $UNAME && \
    useradd -m -u $UID -g $GID $UNAME && \
    chown -R $UID:$GID /home/$UNAME

RUN apt update && \
    apt install wget gnupg2 -y && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt update && \
    apt install google-chrome-stable -y

USER $UNAME

WORKDIR /home/$UNAME

CMD ["/opt/google/chrome/google-chrome","--no-sandbox"]
