FROM node:8.1-slim

RUN apt-get update && \
    apt-get install -y vim bash bzip2 curl fontconfig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ARG APP_HOME="/myapp"
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# install tini
ARG TINI_VERSION="v0.15.0"
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["yarn", "start"]
