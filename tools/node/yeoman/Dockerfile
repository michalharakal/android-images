
FROM node:8.2.1

RUN apt-get update && \
      apt-get -y install sudo

# Add a yeoman user because grunt doesn't like being root
RUN useradd --create-home yeoman
RUN adduser yeoman sudo

# set HOME so 'npm install' and 'bower install' don't write to /
ENV HOME /home/yeoman

RUN chown yeoman /home/yeoman


RUN npm install -g yo
RUN npm install -g generator-android-architecture

RUN chown -R yeoman:yeoman /home/yeoman/.config

USER yeoman

WORKDIR /src
