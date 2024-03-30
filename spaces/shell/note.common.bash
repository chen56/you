#!/usr/bin/env bash
set -o errtrace # -E trap inherited in sub script
set -o errexit # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail

# 模版代码，获取文件真实路径
# On Mac OS, readlink -f doesn't work, so use._real_path get the real path of the file
_real_path() {
  cd "$(dirname "$1")" || exit
  file="$PWD/$(basename "$1")"
  while [[ -L "$file" ]]; do
    file="$(readlink "$file")"
    cd -P "$(dirname "$file")" || exit
    file="$PWD/$(basename "$file")"
  done
  echo "$file"
}

SCRIPT_PATH="$(_real_path "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
SCRIPT_FILE="$(basename "$SCRIPT_PATH")"

print.markdown(){
  # IFS= 表示将IFS清空，也就是将内部字段分隔符设置为空字符串，这样一来，在执行 read 命令时，
  # 将整行文本视为一个单独的字段（即使行中有多个空格、制表符或换行符）。
  # -r 参数告诉 read 命令不进行反斜杠转义（backslash escaping），即不对行中的反斜杠进行特殊处理。
  while IFS= read -r line; do
    echo "$line"
  done
}
