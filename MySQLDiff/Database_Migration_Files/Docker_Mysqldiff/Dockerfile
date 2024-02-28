# Docker container for a simple mysql and mysqldiff setup.


FROM ubuntu:latest

RUN apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install perl mysql-server cpanminus python3 && \
    cpanm MySQL::Diff && \
    cpanm Text::CSV &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create directories
RUN mkdir -p /usr/src/Joomla/Input \
    && mkdir -p /usr/src/Roundcube/Input \
    && mkdir -p /usr/src/Weberp/Input \
    && mkdir -p /usr/src/Joomla/Output \
    && mkdir -p /usr/src/Roundcube/Output \
    && mkdir -p /usr/src/Weberp/Output \
    && mkdir -p /usr/src/Joomla/Logs \
    && mkdir -p /usr/src/Roundcube/Logs \
    && mkdir -p /usr/src/Weberp/Logs 


# Copy additional scripts and files
COPY Joomla/Input /usr/src/Joomla/Input
COPY Roundcube/Input /usr/src/Roundcube/Input
COPY Weberp/Input /usr/src/Weberp/Input
COPY mysqldiffscript.pl /usr/src/mysqldiffscript.pl
COPY cmp_SMOs.pl /usr/src/cmp_SMOs.pl
COPY cmp_schema_changes.py /usr/src/cmp_schema_changes.py

WORKDIR /usr/src/
ENTRYPOINT service mysql start && tail -f /dev/null

