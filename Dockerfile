FROM ubuntu:14.04
MAINTAINER 'github.com/nateleavitt'

RUN echo 'updating apt-get and installing unzip, curl, wget'
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    unzip \
    curl \
    wget

# Download Nomad
RUN echo 'Fetching Nomad...'

RUN cd /tmp
RUN wget https://releases.hashicorp.com/nomad/0.2.1/nomad_0.2.1_linux_amd64.zip --no-check-certificate
RUN echo 'Installing Nomad...'
RUN unzip nomad_0.2.1_linux_amd64.zip
RUN chmod +x nomad
RUN mv nomad /usr/bin/nomad
RUN mkdir /etc/nomad.d
RUN chmod a+w /etc/nomad.d

RUN cd /

ADD ./config_files/server1.hcl /server1.hcl
RUN mkdir server1

#For server service discovery
EXPOSE 4647

CMD /bin/bash -l