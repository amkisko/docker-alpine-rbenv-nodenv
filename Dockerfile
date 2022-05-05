FROM alpine:latest

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/root/.nodenv/shims:/root/.nodenv/bin:$PATH

RUN apk add bash git curl build-base linux-headers gcompat zlib zlib-dev openssl openssl-dev libpq-dev tzdata
RUN apk add python3 ruby nodejs

SHELL ["/bin/bash", "--login", "-c"]

RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN echo 'export PATH="~/.nodenv/bin:$PATH"; eval "$(~/.nodenv/bin/nodenv init -)"' > /etc/profile.d/nodenv_init.sh
RUN mkdir -p "$(~/.nodenv/bin/nodenv root)"/plugins && git clone https://github.com/amkisko/node-build.git "$(~/.nodenv/bin/nodenv root)"/plugins/node-build
RUN ~/.nodenv/bin/nodenv install 18.0.0

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="~/.rbenv/bin:$PATH"; eval "$(~/.rbenv/bin/rbenv init -)"' > /etc/profile.d/rbenv_init.sh
RUN mkdir -p "$(~/.rbenv/bin/rbenv root)"/plugins && git clone https://github.com/rbenv/ruby-build.git "$(~/.rbenv/bin/rbenv root)"/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 3.1.1

