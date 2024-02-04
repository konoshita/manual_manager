# 既存アプリのrubyバージョンと合わせる
FROM ruby:2.7.3

# Node.jsとyarnのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn

# Dockerコンテナに作業ディレクトリを作成する
WORKDIR /sample_manual

# ホスト側のGemfileとGemfile.lockをDockerコンテナ側にコピーする
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# bundlerをインストールした後、gemをインストールする
RUN gem install bundler
RUN bundle install

# ホストのアプリケーションをdockerコンテナにコピー
COPY . /sample_manual

# dockerコンテナ起動時にentrypoint.shが実行されるように設定
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# dockerの3000番ポートを解放する
EXPOSE 3000

# Railsサーバーの実行コマンド
# (バインドを0.0.0.0とし、アクセスするipアドレスの制限をなくす)
CMD ["rails", "server", "-b", "0.0.0.0"]

