# Project Zomboid build
FROM steamcmd/steamcmd:ubuntu-jammy

# Create dir for server
run mkdir /opt/pzserver

# Install the server
RUN steamcmd +force_install_dir /opt/pzserver +login anonymous +app_update 380870 validate +quit

COPY ./bootstrap.sh /opt/pzserver
RUN chmod +x /opt/pzserver/bootstrap.sh

EXPOSE 8766/udp
EXPOSE 16261/udp
EXPOSE 16262/udp

RUN useradd -ms /bin/bash pzserver
WORKDIR /home/pzserver
RUN chown -R pzserver /opt/pzserver

USER pzserver

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/opt/pzserver/bootstrap.sh" ]