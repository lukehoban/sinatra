FROM gliderlabs/alpine:3.2

RUN apk-install ruby ruby-bundler ruby-kgio ruby-pg ruby-raindrops ruby-unicorn

WORKDIR /app

# cache bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# copy the rest of the app
COPY . /app
