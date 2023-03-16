FROM ruby:3.1
ENV TZ Asia/Tokyo
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# 「FROM」使用するイメージとバージョン
# 「RUN」コマンドの実行
# 「-qqオプション」はエラー以外何も吐かないことを意味する。
# 「-y」オプションは全部yesで実行することを意味する。

RUN mkdir /myapp
WORKDIR /myapp
# WORKDIR:ワーキングディレクトリ。作業ディレクトリの指定

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# COPY:ホスト側のコピー元ファイルをコピー先ファイルまたはディレクトリにコピー

RUN bundle install
COPY . /myapp
#それぞれのrunが独立して動いて　階層構造