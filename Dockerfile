FROM node:20-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /srv/app

COPY package*.json ./

RUN npm install --unsafe-perm

COPY . .

RUN NODE_OPTIONS="--max_old_space_size=4096" npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]


