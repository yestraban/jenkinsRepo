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
RUN mv -f ./pg_hba.conf /etc/postgresql/13/main/
RUN netstat -ap | grep :5432
RUN systemctl start postgresql
RUN service postgresql start
#RUN ps -ef | grep postgres
#RUN /etc/init.d/postgresql restart
#RUN ps -ef | grep postgres
#RUN ls /var/log/postgresql/
#RUN /etc/init.d/postgresql restart
RUN su postgres
#RUN pg_ctlcluster 13 main start
#RUN su - postgres -c '/usr/lib/postgresql/13/bin/postgres "-D" "/var/lib/postgresql/13/main" "-c" "config_file=/etc/postgresql/13/main/postgresql.conf"'
RUN systemctl status postgresql@13-main.service
RUN cat /var/log/postgresql/postgresql-13-main.log
RUN psql
RUN CREATE ROLE jhipsterSampleApplication WITH LOGIN SUPERUSER PASSWORD 'test';
RUN CREATE DATABASE jhipster
RUN \q
RUN exit
RUN java -jar target/*.jar