# gemfileに記載のrubyのversion指定
FROM ruby:2.5.7 

# /var/lib/apt/lists配下のキャッシュを削除し容量を小さくする
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y default-mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Docker内部でworkdirをどこに置くか、どういう名前にするかを決める記述
RUN mkdir /totonou_sauna
WORKDIR /totonou_sauna

# Docker内部でGemfile、Gemfile.lockをどこに配置するかを決める記述
ADD Gemfile /totonou_sauna/Gemfile
ADD Gemfile.lock /totonou_sauna/Gemfile.lock

# Gemfile.lockのbundlerのバージョンが2以上の場合は記述
ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install

COPY . /totonou_sauna