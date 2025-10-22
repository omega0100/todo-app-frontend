# 1. Build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
# 2. Serve stage
# 2. Serve stage
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Optional: copy a custom nginx.conf if you need routing fallback
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
