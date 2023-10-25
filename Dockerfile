#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
# Use the node:10-alpine image as a base
FROM node:10-alpine

# Add node user - maybe don't need to do this?
RUN useradd -ms /bin/bash node

# Create a directory for the app
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# Change working directory to the one we created
WORKDIR /home/node/app 

USER node

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install all packages from package.json
RUN npm install

# Expose port 8080
EXPOSE 8080

# Run the app
CMD ["npm", "start"]
