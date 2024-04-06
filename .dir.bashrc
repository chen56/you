#!/usr/bin/env bash


# 每次cd到当前目录，就执行此脚本，获得便利

# ~/.bashrc 加：
# 本脚本替换掉系统cd,使每次进入某个目录，只要有“.dir.bashrc”目录特定bashrc就执行之
# function _dir_bashrc(){
#   if [[ -f "$PWD/.dir.bashrc" ]]; then
#     # shellcheck disable=SC1091
#     source "$PWD/.dir.bashrc"
#     echo "当前目录存在 $PWD/.dir.bashrc,已执行"
#   fi
# }
# _dir_bashrc
# function cd() {
#     builtin cd "$@" >/dev/null|| exit
#     _dir_bashrc
# }

# On Mac OS, readlink -f doesn't work, so use._real_path get the real path of the file
_real_path() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}
SCRIPT_PATH="$(_real_path "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

alias bake="$SCRIPT_DIR/bake"
alias note="$SCRIPT_DIR/bake flutter"