FROM node:slim

WORKDIR /frontend

COPY package.json ./

RUN npm install
COPY . .

CMD [ "npm", "run", "dev" ]