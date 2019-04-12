FROM ruby:2.5.1

RUN apt-get update && apt-get upgrade -y

RUN apt-get install --fix-missing sqlite -y 

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /gems

COPY . .