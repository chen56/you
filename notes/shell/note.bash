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

#SCRIPT_PATH="$(_real_path "${BASH_SOURCE[0]}")"
#SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
#SCRIPT_FILE="$(basename "$SCRIPT_PATH")"


# include common script
source "$SCRIPT_DIR/common.bash"

a(){
  echo xxx
}

c(){
  echo xxx
}
b(){
  echo xxx
}
 bs() {
   echo ss
 }
bake.go "$@"