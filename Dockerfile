##FROM nexus.d.lowes.com:8800/digital/node-v8:8.11.1-alpine
FROM node:8-alpine

COPY package*.json ./

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app

WORKDIR /ng-app

COPY . .

##EXPOSE 3000

CMD npm start
##RUN $(npm bin)/ng build --prod --build-optimizer