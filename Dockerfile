FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm

# Bundle app source
RUN mkdir /var/docker_test
COPY . /var/docker_test

# Install app dependencies
RUN cd /var/docker_test; npm install

EXPOSE  8080
CMD ["node", "/var/docker_test/index.js"]