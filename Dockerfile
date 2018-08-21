FROM kalilinux/kali-linux-docker

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF
	    
RUN echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src https://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Install software and tools
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq dist-upgrade \
    && apt-get install kali-linux-full \
    && apt-get clean
    
# start application
CMD ["bash"]
