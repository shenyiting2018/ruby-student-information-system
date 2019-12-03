FROM debian:latest

RUN apt-get update \
    && apt-get install -y \
        vim \
        git \
        procps

RUN apt-get install -y \
        ruby \ 
        ruby-dev \
        build-essential \
        libsqlite3-dev

RUN gem install \
        rake \
        debase

RUN gem install \
        sinatra \
        sinatra-reloader \
        thin \
        data_mapper \
        dm-sqlite-adapter 

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EXPOSE 80
