# Use Node.js 18 Alpine as base image
FROM node:18-alpine

# Install git and other dependencies
RUN apk add --no-cache git bash

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm@9.4.0

# Copy package files and scripts
COPY package.json pnpm-lock.yaml* bindings.sh ./
RUN chmod +x bindings.sh

# Copy env file
COPY .env.local ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the application
RUN pnpm build

# Expose port 3000
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Start the application
CMD ["pnpm", "start"]
