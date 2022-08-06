FROM ruby:3.1.2-alpine

RUN apk update && apk add build-base ruby-dev libpq postgresql-dev

RUN gem install bundler -v 2.3.18

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config set without 'development test' && bundle install -j 12

COPY . .

EXPOSE 4567

ENV RACK_ENV production

CMD ["/app/bin/webapp"]
