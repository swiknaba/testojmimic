#
# Quick hack, installs all kind of development dependencies
# don't copy-paste this for production use :)
#

FROM node:14.20.1-alpine3.15 AS node
FROM ruby:2.7.5-alpine3.13 AS ruby

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /opt /opt

ENV GEM_HOME /app/vendor/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV RAILS_ENV=development

WORKDIR /app

RUN mkdir -p tmp/pids
RUN apk add --no-cache postgresql-dev ttf-ubuntu-font-family shared-mime-info
RUN apk add --no-cache build-base git openssh-client postgresql-dev

RUN gem install bundler:2.3.16 \
  && bundle -v \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin" \
  && bundle config --global without 'test' \
  && bundle config --global jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` \
  && bundle config --global retry 3 \
  && bundle config --global

ADD . ./

RUN bundle install
RUN yarn install
