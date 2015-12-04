FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    unzip \
    curl \
    wget

WORKDIR /tmp

# Download Nomad
RUN echo 'Fetching Nomad...'
RUN wget https://releases.hashicorp.com/nomad/0.2.1/nomad_0.2.1_linux_amd64.zip --no-check-certificate

RUN echo 'Installing Nomad...'
RUN unzip -d /usr/bin nomad_0.2.1_linux_amd64.zip 
RUN chmod +x /usr/bin/nomad

RUN mkdir /etc/nomad.d
RUN chmod a+w /etc/nomad.d

ADD ./config_files/server1.hcl /server1.hcl
RUN mkdir server1

#For server service discovery
EXPOSE 4647

CMD /bin/bash -l