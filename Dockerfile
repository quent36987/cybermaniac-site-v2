FROM node:24.22-alpine3.24 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --no-audit --no-fund
COPY . .
RUN npm run build

FROM nginxinc/nginx-unprivileged:1.31-alpine AS runtime
# Mise à jour des paquets Alpine (correctifs de sécurité), puis retour à l'utilisateur non root
USER root
RUN apk upgrade --no-cache
USER 101
COPY ./docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 8080
