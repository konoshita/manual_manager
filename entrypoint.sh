
# bin/bashが起動する
set -e

# railsエラーを招くプロセスを削除する
rm -f /myapp/tmp/pids/server.pid

# DockerfileのCMDに動作が移る設定
exec "$@"

