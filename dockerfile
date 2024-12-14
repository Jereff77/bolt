FROM node:18-alpine

WORKDIR /app

# Install basic dependencies
RUN apk add --no-cache git bash

# Install pnpm
RUN npm install -g pnpm@9.4.0

# Copy package files
COPY package.json ./
COPY pnpm-lock.yaml ./
COPY .env.local ./
COPY bindings.sh ./

# Make bindings.sh executable
RUN chmod +x bindings.sh

# Install dependencies
RUN pnpm install

# Copy application files
COPY . .

# Build
RUN pnpm build

# Expose port
EXPOSE 3000

# Environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Start
CMD ["pnpm", "start"]
