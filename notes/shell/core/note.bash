#!/usr/bin/env bash
set -o errtrace # -E trap inherited in sub script
set -o errexit # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail

# 模版代码，获取文件真实路径
# On Mac OS, readlink -f doesn't work, so use._real_path get the real path of the file
_real_path() {  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}" ; }

SCRIPT_PATH="$(_real_path "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
#SCRIPT_FILE="$(basename "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../common.bash"

print.markdown <<'MARKDOWN_END'
# bash 核心 - 命令行、字符串、分割符、转义

了解字符串，字符串分割，转义，是bash的核心

## 转义字符串

MARKDOWN_END


(
  # 了解字符串，字符串分割，转义，是bash的核心
  unescaped_string="Hello
  World"
  # 使用printf命令，"%b"参数可以正确处理转义字符
  printf -v escaped_string "%q" "$unescaped_string"

  echo "escaped_string: $escaped_string"
)


(
  # 了解字符串，字符串分割，转义，是bash的核心
  escaped_string="Hello\nWorld"
  # 使用printf命令，"%b"参数可以正确处理转义字符
  printf -v unescaped_string "%b" "$escaped_string"

  echo "unescaped_string: $unescaped_string"
)
