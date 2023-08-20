# JRE base
FROM openjdk:17-slim

# Environment variables
ENV MC_VERSION="latest" \
    PAPER_BUILD="latest" \
    MC_RAM="" \
    JAVA_OPTS=""

COPY papermc.sh .
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /papermc

# Start script
CMD ["bash", "./papermc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
EXPOSE 19132/tcp
EXPOSE 19132/udp
EXPOSE 19133/tcp
EXPOSE 19133/udp
VOLUME /papermc
