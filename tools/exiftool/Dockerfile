FROM alpine

RUN apk add --no-cache sudo bash exiftool

ARG user=appuser
ARG group=appuser
ENV USER_UID=1000
ENV USER_GID=1000

WORKDIR /work    

COPY files/. /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["exiftool"]
