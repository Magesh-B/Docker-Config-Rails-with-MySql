FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /testing_app
WORKDIR /testing_app
ADD Gemfile /testing_app/Gemfile
ADD Gemfile.lock /testing_app/Gemfile.lock
RUN bundle install
ADD . /testing_app