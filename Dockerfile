#New Comment
FROM node:boron
MAINTAINER mike.coleman@docker.com

# set default workdir
WORKDIR /usr/src

# Add package.json to allow for caching
COPY package.json /usr/src/package.json

RUN npm config set registry http://registry.npmjs.org/


# Install app dependencies
RUN npm install

# Bundle app source and tests
COPY app.js /usr/src/
COPY test /usr/src/test
COPY script /usr/src/script

# user to non-privileged user
USER nobody

# Expose the application port and run application
EXPOSE 5000
CMD ["node","app.js"]
