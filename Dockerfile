# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock if you use yarn)
COPY package*.json ./

# If you're using yarn, uncomment the next line
# COPY yarn.lock .

# Install any dependencies
RUN npm install

# If you're using yarn, uncomment the next line
# RUN yarn install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# TypeScript compile
RUN npm run build

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD [ "npm", "start" ]

# To build and run the Docker image, assuming you name this Dockerfile as `Dockerfile`, use the following commands:
# docker build -t my-react-app .
# docker run -p 3000:3000 my-react-app
