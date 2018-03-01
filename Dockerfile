ARG NODE_VERSION=7

FROM node:${NODE_VERSION}

LABEL maintainer="<rubyisbeautiful> bcptaylor@gmail.com"

ARG ELM_VERSION=0.18.0
ARG ELM_PORT=8000

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global \
    PATH="$PATH:/home/node/.npm-global/bin" \
    ELM_PORT="${ELM_PORT}"

EXPOSE ${ELM_PORT}

COPY . /home/node/app

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /home/node/app

RUN npm install --loglevel=warn -g elm@${ELM_VERSION} \
 && if [ -f elm-package.json ]; then elm-package install -y; fi \
 && chown -R node:node /home/node \
 && chmod a+x /usr/local/bin/entrypoint.sh

USER node

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]