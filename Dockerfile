FROM node:16.14.2-alpine3.15

ENV PROJECT_ROOTDIR=/home/node/app/

USER node

RUN mkdir -p $PROJECT_ROOTDIR
WORKDIR $PROJECT_ROOTDIR

COPY --chown=node:node package.json pnpm-lock.yaml $PROJECT_ROOTDIR

RUN pnpm i

COPY --chown=node:node . $PROJECT_ROOTDIR

RUN tsc

CMD ["pnpm", "start"]
