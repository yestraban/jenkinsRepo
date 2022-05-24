from jenkins-build:latest
RUN apt install curl ca-certificates gnupg
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc \
| gpg --dearmor \
| tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" \
> /etc/apt/sources.list.d/postgresql.list'
RUN apt update
RUN apt upgrade -y
RUN apt install systemctl
RUN apt install postgresql-13 -y
RUN systemctl enable postgresql
RUN systemctl start postgresql
RUN mv -f ./pg_hba.conf /etc/postgresql/13/main/
RUN service postgresql restart
RUN su - postgres
RUN psql
RUN CREATE ROLE jhipsterSampleApplication WITH LOGIN SUPERUSER PASSWORD 'test';
RUN CREATE DATABASE jhipster
RUN \q
RUN exit
RUN java -jar target/*.jar