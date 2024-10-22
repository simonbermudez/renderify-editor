# Use an official Node runtime as the base image
FROM node:18-alpine

# Install pnpm
RUN npm install -g pnpm@8.6.12

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml (if available)
COPY package.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install --no-frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the application
RUN pnpm run build