#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
# Use the node:10-alpine image as a base
FROM node:10-alpine

# Create a directory for the app
WORKDIR /app

# Set the owner of the directory to 'node'
RUN chown -R node:node /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install all packages from package.json
RUN npm install

# Expose port 8080
EXPOSE 8080

# Run the app
CMD ["npm", "start"]
