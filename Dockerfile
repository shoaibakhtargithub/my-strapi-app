FROM node:20-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /srv/app

COPY package*.json ./


RUN npm install --unsafe-perm

# now copy the rest of the source code
COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm","run","start"]

