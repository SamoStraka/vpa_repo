# Use the official Node.js image for the build stage
FROM node:16 AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application
RUN npm run build

# Use the official Nginx image for the runtime stage
FROM nginx:1.19

# Copy the build output to the Nginx html directory
COPY --from=build /app/dist /usr/share/nginx/html

# Update the Nginx configuration
RUN sed -i -e '/location \/ {/a try_files $uri $uri\/ \/index.html;' /etc/nginx/conf.d/default.conf

# Expose the Nginx server port
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
