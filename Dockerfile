FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /adminapp
WORKDIR /adminapp
ADD Gemfile /adminapp/Gemfile
ADD Gemfile.lock /adminapp/Gemfile.lock
RUN bundle install
ADD . /adminapp
RUN rake db:migrate RAILS_ENV=production
CMD ["rails","server","-b","0.0.0.0"]
