# ----------------------------------
# Holdfast: Nations at War Dockerfile
# Environment: Ubuntu:18.04
# Minimum Panel Version: 0.7.9
# ----------------------------------
FROM        ubuntu:18.04
MAINTAINER Ankit Patel, <ankit@bmghosting.com>

# Install Dependencies
RUN         apt update \
            && apt upgrade -y \
            && apt install -y wget ca-certificates libsqlite3-0 --install-recommends \
            && apt clean \
	    && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
