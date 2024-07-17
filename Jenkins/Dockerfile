FROM jenkins/jenkins:lts-jdk17

# Copy our config files from workspace to ref
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# install plugins as defined by plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt