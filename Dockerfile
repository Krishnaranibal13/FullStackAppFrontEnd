# Build React App
FROM node:18 AS build

WORKDIR /app
COPY . .

# 🔥 FIX HERE
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm install
RUN npm run build

# Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
