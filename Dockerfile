FROM ruby:2.7.0-alpine3.11

RUN apk update && apk add build-base

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config set without 'development test' && bundle install -j 12

COPY . .

EXPOSE 4567

ENV ENV production

CMD ["/app/bin/webapp"]
