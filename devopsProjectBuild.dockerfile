FROM jenkins-dependencies
WORKDIR /jhipster-sample-app/
RUN mvn clean package -DSkipTests