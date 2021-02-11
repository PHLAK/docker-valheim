FROM cm2network/steamcmd
LABEL author="Chris Kankiewicz <Chris@ChrisKankiewciz.com>"

ENV LD_LIBRARY_PATH "/home/steam/Steam/steamapps/common/Valheim dedicated server/linux64"
ENV SteamAppId 892970

ENV SERVER_NAME "My World"
ENV SERVER_PASSWORD "secret"
ENV SERVER_PORT 2456
ENV WORLD_NAME "Valhalla"

EXPOSE 2456-2458/udp

RUN mkdir -p /home/steam/.config/unity3d/IronGate/Valheim
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +app_update 896660 validate +quit

VOLUME /home/steam/.config/unity3d/IronGate/Valheim

WORKDIR "/home/steam/Steam/steamapps/common/Valheim dedicated server"

CMD "/home/steam/Steam/steamapps/common/Valheim dedicated server/valheim_server.x86_64" \
    -name "${SERVER_NAME}" -password "${SERVER_PASSWORD}" -world "${WORLD_NAME}" -port ${SERVER_PORT}
