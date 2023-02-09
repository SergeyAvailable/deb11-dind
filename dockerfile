FROM debian:11

RUN apt update && apt install -y ca-certificates curl gnupg lsb-release
RUN mkdir -m 0755 -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
COPY ./start.bash /usr/bin/start.bash 
RUN chmod +x /usr/bin/start.bash
#RUN echo "#!/usr/bin/env bash \n FILE=/var/run/docker.sock\n if test -f "$FILE"; then\n exec sleep infinity\n else\n dockerd\n fi" > /usr/bin/start
CMD ["/usr/bin/start.bash"]
