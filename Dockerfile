FROM ruby:2.2-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl \
    && gem install --no-ri --no-rdoc bundler

ADD Gemfile Gemfile.lock /src/
WORKDIR /src
RUN bundle install

VOLUME /src/recipes
