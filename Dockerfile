FROM ruby:2.4.1-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /deployr
WORKDIR /deployr
ADD Gemfile /deployr/Gemfile
ADD Gemfile.lock /deployr/Gemfile.lock
RUN bundle install
ADD . /deployr