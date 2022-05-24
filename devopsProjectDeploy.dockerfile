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
RUN service postgresql start
RUN mv -f ./pg_hba.conf /etc/postgresql/13/main/
RUN systemctl restart postgresql
RUN service postgresql restart
RUN ps -ef | grep postgres
RUN /etc/init.d/postgresql restart
RUN ps -ef | grep postgres
RUN ls /var/log/postgresql/
RUN cat /var/log/postgresql/postgresql-13-main.log
RUN su - postgres
RUN psql
RUN CREATE ROLE jhipsterSampleApplication WITH LOGIN SUPERUSER PASSWORD 'test';
RUN CREATE DATABASE jhipster
RUN \q
RUN exit
RUN java -jar target/*.jar