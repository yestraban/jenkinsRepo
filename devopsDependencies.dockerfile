FROM node:18-bullseye
RUN apt install git
RUN git clone https://github.com/jhipster/jhipster-sample-app.git
RUN apt update && apt upgrade -y
RUN apt install openjdk-17-jdk -y
RUN apt install bash -y
RUN apt install maven -y
RUN mvn -v
WORKDIR /jhipster-sample-app/
RUN npm install