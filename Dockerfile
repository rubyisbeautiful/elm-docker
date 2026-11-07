ARG NODE_VERSION=22.23.4

FROM node:${NODE_VERSION}

# Enforce Node.js 22.x >= 22.23.4 to mitigate CVE-2026-111497
RUN node -e "const [major,minor,patch]=process.versions.node.split('.').map(Number); if(major!==22||(minor<23||(minor===23&&patch<4))) { console.error('Node version ' + process.versions.node + ' is unsupported; Node.js 22.23.4 or newer in the 22.x line is required for CVE-2026-111497'); process.exit(1); }"

LABEL maintainer="<rubyisbeautiful> bcptaylor@gmail.com"

ARG ELM_VERSION=0.19.1
ARG ELM_PORT=8000
ARG ELM_TEST_VERSION=0.19.1-revision6

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global \
    PATH="$PATH:/home/node/.npm-global/bin" \
    ELM_PORT="${ELM_PORT}"

EXPOSE ${ELM_PORT}

COPY . /home/node/app

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /home/node/app

RUN npm install --loglevel=warn -g elm@${ELM_VERSION} elm-test@${ELM_TEST_VERSION} \
 && if [ -f elm-package.json ]; then elm-package install -y; fi \
 && chown -R node:node /home/node \
 && chmod a+x /usr/local/bin/entrypoint.sh

USER node

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
