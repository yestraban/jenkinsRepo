FROM jenkins-dependencies:latest
WORKDIR /jhipster-sample-app/
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
RUN tar xzvf apache-maven-3.8.5-bin.tar.gz
RUN export PATH=/apache-maven-3.8.5/bin:$PATH
RUN mvn clean package -DSkipTests