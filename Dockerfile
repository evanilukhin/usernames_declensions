FROM ruby:2.6.5-alpine

RUN apk add --no-cache --update build-base \
    linux-headers \
    bash \
    git \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata

ENV APP_PATH /usr/src/app
ENV RAILS_ENV production
ENV SECRET_KEY_BASE not_necessary

# Different layer for gems installation
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN gem list bundler
RUN gem install bundler
RUN gem list bundler
RUN bundle install
# Copy the application into the container
COPY . $APP_PATH
RUN rake assets:precompile
EXPOSE 3000
CMD ["bin/rails", "s"]
