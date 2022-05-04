FROM alpine:latest

ENV PATH "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.nodenv/shims:$HOME/.nodenv/bin:$PATH"

RUN apk add bash git curl build-base zlib zlib-dev openssl openssl-dev

RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN echo 'export PATH="$HOME/.nodenv/bin:$PATH"; eval "$($HOME/.nodenv/bin/nodenv init -)"' >> ~/.profile
RUN mkdir -p "$(~/.nodenv/bin/nodenv root)"/plugins && git clone https://github.com/nodenv/node-build.git "$(~/.nodenv/bin/nodenv root)"/plugins/node-build
RUN ~/.nodenv/bin/nodenv install 18.0.0

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$($HOME/.rbenv/bin/rbenv init -)"' >> ~/.profile
RUN mkdir -p "$(~/.rbenv/bin/rbenv root)"/plugins && git clone https://github.com/rbenv/ruby-build.git "$(~/.rbenv/bin/rbenv root)"/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 3.1.1
