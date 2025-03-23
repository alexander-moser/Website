#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN ng build --prod # Loads variables from environments.prod.ts
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/demo-app /usr/share/nginx/html
