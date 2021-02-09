# Multi-stage build

# Build the app
FROM node:alpine
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Serve the application via web server
FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html
