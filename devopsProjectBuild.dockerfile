FROM jenkins-dependencies:latest
WORKDIR /jhipster-sample-app/
RUN ./mvnw -Pprod clean verify