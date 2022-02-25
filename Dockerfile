FROM ruby:3

RUN apt-get update &&\
  apt-get install -y libpoppler-glib8 curl firefox-esr --no-install-recommends &&\
  apt-get clean &&\
  mkdir /app
COPY . /app
WORKDIR /app
RUN bundle install
RUN curl -sL https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz -o geckodriver.tgz &&\
  tar -xzvf geckodriver.tgz &&\
  rm geckodriver.tgz &&\
  mv geckodriver /usr/bin/geckodriver &&\
  chmod a+x /usr/bin/geckodriver
