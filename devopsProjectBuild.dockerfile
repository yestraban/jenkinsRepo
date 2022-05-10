FROM jenkins-dependencies
RUN mvn clean package -DSkipTests