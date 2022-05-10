FROM jenkins-dependencies:latest
WORKDIR /jhipster-sample-app/
RUN export PATH=/apache-maven-3.8.5/bin:$PATH
RUN mvn clean package -DSkipTests