FROM jenkins/jenkins:lts
USER root
ENV DOCKERVERSION=18.03.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz
USER jenkins
COPY plugins.txt /tmp/plugins.txt
COPY config.xml.override /usr/share/jenkins/ref/config.xml.override
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt 

