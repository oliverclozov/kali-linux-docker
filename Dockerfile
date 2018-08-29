FROM kalilinux/kali-linux-docker

# Metadata
ARG BUILD_DATE
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.name='Infosec Kali Linux' \
      org.label-schema.description='This is a test kali-linux docker image to deploy to Azure' 
      #org.label-schema.docker.cmd='docker run --rm kalilinux/kali-linux-docker' \
      #org.label-schema.docker.cmd.devel='docker run --rm -ti kalilinux/kali-linux-docker' \
      #org.label-schema.docker.debug='docker logs $CONTAINER' \
      #io.github.offensive-security.docker.dockerfile="Dockerfile"
	    
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Install software and tools
ENV DEBIAN_FRONTEND noninteractive

# set -x instructs the shell to print commands and their arguments as they are executed.
RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq dist-upgrade \
    #&& apt-get install kali-linux-full -yqq \
    && apt-get clean
    
# remove apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*

# Add new user
#RUN useradd --create-home --home /home/pentester --shell /bin/bash --groups sudo pentester

# Run container as user
#USER pentester

# Set directory container will start in
#WORKDIR /home/pentester

# HEALTHCHECK --interval=60s --timeout=30s --start-period=30s --retries=3

# open SSH port
#EXPOSE 22

# Start application
CMD ["bash"]
