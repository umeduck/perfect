FROM ruby:3.3

# 必要パッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev \
    nodejs npm sqlite3 libsqlite3-dev && \
    npm install -g yarn

# railsのインストール
RUN gem install rails

# 作業ディレクトリの作成
WORKDIR /app

# Gemfile をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリの全体コピー
COPY . .

EXPOSE 3000

# Railsを起動
CMD ["rails", "server", "-b", "0.0.0.0"]