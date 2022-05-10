FROM node:17-bullseye
RUN apt install git
RUN git clone https://github.com/jhipster/jhipster-sample-app.git
RUN apt update && apt upgrade -y
RUN apt install openjdk-17-jdk -y
RUN apt install bash -y
RUN apt install source -y
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
RUN tar xzvf apache-maven-3.8.5-bin.tar.gz
RUN mv apache-maven-3.8.5 /usr/share/maven
RUN echo 'export PATH="$PATH:/usr/share/maven"' >> ~/.bashrc
RUN echo 'export PATH="$PATH:/usr/share/maven/bin"' >> ~/.bashrc
RUN source ~/.bashrc
RUN mvn -v
WORKDIR /jhipster-sample-app/
RUN npm install