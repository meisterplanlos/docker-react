FROM node:alpine AS builder
WORKDIR /var/apps/frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine AS server
COPY --from=builder /var/apps/frontend/build /usr/share/nginx/html
