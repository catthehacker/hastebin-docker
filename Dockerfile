FROM node:alpine

RUN apk --update add --no-cache git && \
    git clone https://github.com/seejohnrun/haste-server.git /opt/haste && \
    rm -rf /opt/haste/.git/ && \
    rm -f /opt/haste/about.md
WORKDIR /opt/haste
ADD conf/about.md /opt/haste/
RUN apk del git && \
    npm install && \
    rm -rf /opt/haste/config.js && \
    ln -s /opt/haste/config.json /opt/haste/config.js
ADD conf/config.json /opt/haste/config.json

VOLUME ["/opt/haste"]

EXPOSE 80
CMD ["npm", "start"]
