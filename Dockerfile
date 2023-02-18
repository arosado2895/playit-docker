#Use latest ubuntu as base
FROM ubuntu:latest
#Make sure wget is installed
RUN apt update -y && apt install --no-install-recommends wget ca-certificates -y
#Add user "container" which is used to run playit agent later
RUN useradd -d /home/container -s /bin/bash container
#Set the working directory
WORKDIR /home/container
#Download and set permissions for playit
RUN wget -O playit https://new.playit.gg/downloads/playit-0.9.3
RUN chmod u+x playit
#Set user
USER container
#Create volume, if user didn't set up any
VOLUME ["/home/container"]
ENTRYPOINT ["./playit", "--stdout-logs"]