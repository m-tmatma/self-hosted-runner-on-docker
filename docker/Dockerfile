FROM ubuntu:22.04

# perl is for shasum
RUN apt-get update && \
    apt-get install \
    curl \
    perl \
    jq \
    -y

WORKDIR /workdir/
COPY *.sh /workdir/
RUN chmod +x /workdir/*.sh && \
    ./get-runner-files.sh

CMD ["/workdir/invoke-runner.sh"]
