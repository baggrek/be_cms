FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /api_cms

COPY Gemfile.lock ./
COPY Gemfile ./
COPY . ./
RUN bundle install --without development test

ENV RAILS_ENV production
RUN rm -rf tmp/
