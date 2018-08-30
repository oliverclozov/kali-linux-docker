FROM kalilinux/kali-linux-docker
# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL io.tcsec-schema.build-date=$BUILD_DATE \
      io.tcsec-schema.vcs-url=$VCS_URL \
      io.tcsec-schema.vcs-ref=$VCS_REF \
      io.tcsec-schema.version=$VERSION \
      io.tcsec-schema.name='Kali Linux' \
      io.tcsec-schema.description='Official Kali Linux docker image' \
      io.tcsec-schema.usage='https://www.kali.org/news/official-kali-linux-docker-images/' \
      io.tcsec-schema.url='https://www.kali.org/' \
      io.tcsec-schema.vendor='Offensive Security' \
      io.tcsec-schema.schema-version='1.0' \
      io.tcsec-schema.docker.cmd='docker run -it kaliregistry.azurecr.io/tcnetkali:v1 /bin/bash' \
      io.tcsec-schema.docker.cmd.devel='docker run -it kaliregistry.azurecr.io/tcnetkali:v1 /bin/bash' \
      #io.tcsec-schema.docker.debug='docker logs $CONTAINER'
      #io.github.offensive-security.docker.dockerfile="Dockerfile" \
      #io.github.offensive-security.license="GPLv3" \
RUN echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq dist-upgrade \
    && apt-get clean
CMD ["bash"]
