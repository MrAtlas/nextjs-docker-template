# syntax=docker.io/docker/dockerfile:1

# Base image
FROM node:18-alpine AS base

# Install dependencies only when needed
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copy only necessary files to install dependencies
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./ 

# Install dependencies based on lock file
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Copy application code
COPY . .

# Copy the PocketBase binary from the local directory
COPY pocketbase_linux/pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Ensure PocketBase binary is executable
RUN chmod +x /app/pocketbase

# Install PM2 to manage multiple processes
RUN npm install -g pm2

# Expose necessary ports
EXPOSE 3000 8090

# Use PM2 to run both PocketBase and Next.js
CMD ["pm2-runtime", "ecosystem.config.js"]
