# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy the relevant dependencies first for layer caching
COPY package*.json ./

RUN npm install

# Copy the rest of the source code
COPY . .

# Build the app
RUN npm run build

# Stage 2: Multistage
FROM nginxinc/nginx-unprivileged:1.27-alpine-slim

# Remove the default PID directive to avoid permission issues
RUN sed -i '/^pid/d' /etc/nginx/nginx.conf && \
    echo "pid /tmp/nginx.pid;" >> /etc/nginx/nginx.conf

# Copy the built app from build stage
COPY --from=builder /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
