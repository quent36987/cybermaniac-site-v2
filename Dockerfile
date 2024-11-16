## Étape 1 : Construire l'application
## Utilisez l'image Node.js pour installer les dépendances et construire l'app
#FROM node:18 AS builder
#
## Définissez le répertoire de travail dans le conteneur
#WORKDIR /app
#
## Copiez les fichiers de votre application dans le conteneur
#COPY . .
#
## Installez les dépendances
#RUN npm install
#
## Construisez l'application
#RUN npm run build
#
## Étape 2 : Serveur pour héberger les fichiers construits
## Utilisez une image légère de serveur pour déployer l'application
#FROM nginx:alpine
#
## Copiez les fichiers construits de l'étape précédente vers le répertoire NGINX
#COPY --from=builder /app/dist /usr/share/nginx/html
#COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
## Expose le port 80
#EXPOSE 80
#
## Lance NGINX
#CMD ["nginx", "-g", "daemon off;"]
FROM node:lts AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine AS runtime
COPY ./docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 8080