#stage 1
FROM node:latest AS node

WORKDIR /app

COPY . .

RUN npm install -g @angular/cli

RUN npm install

RUN ng build

#stage 2
FROM nginx:alpine

COPY --from=node /app/dist/website /usr/share/nginx/html
