FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FABAEF95 && \
	add-apt-repository -y ppa:supercollider/ppa && \
	add-apt-repository -y multiverse && \
	apt-get update && \
    apt-get install -y icecast2 darkice libasound2 libasound2-plugins alsa-utils alsa-oss jack-tools supercollider xvfb curl && \
    apt-get clean

RUN curl -o forego.tgz https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.tgz && \
	tar xvf forego.tgz && \
	rm forego.tgz && \
	mv forego /usr/bin/forego && \
	chmod +x /usr/bin/forego

COPY asoundrc /root/.asoundrc

COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice.cfg

COPY startup.scd /root/.config/SuperCollider/startup.scd
COPY radio.sc /radio.sc

COPY Procfile Procfile

EXPOSE 8000
RUN mv /etc/security/limits.d/audio.conf.disabled /etc/security/limits.d/audio.conf && \
	usermod -a -G audio root

CMD ["forego", "start"]
