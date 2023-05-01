FROM node:20

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy tini libc++1

WORKDIR /app
COPY ./src ./

RUN npm install -g wrangler
RUN npm ci

ENV WRANGLER_SEND_METRICS=false

CMD ["wrangler", "dev", "--local"]
