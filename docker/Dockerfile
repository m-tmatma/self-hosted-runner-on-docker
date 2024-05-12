FROM ubuntu:22.04

# perl is for shasum
RUN apt-get update && \
    apt-get install \
    curl \
    perl \
    jq \
    -y

WORKDIR /actions-runner/
COPY *.sh /actions-runner/
RUN chmod +x /actions-runner/*.sh && \
    ./get-runner-files.sh
