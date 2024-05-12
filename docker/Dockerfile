FROM ubuntu:22.04

# perl is for shasum
RUN apt-get update && \
    apt-get install \
    curl \
    perl \
    jq \
    -y

COPY *.sh /root/
WORKDIR /root/
RUN chmod +x /root/*.sh && \
    ./get-runner-files.sh

