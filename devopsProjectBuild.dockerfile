FROM jenkins-dependencies:latest
WORKDIR /jhipster-sample-app/
RUN mvn clean package -DSkipTests