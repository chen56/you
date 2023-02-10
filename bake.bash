#!/usr/bin/env bash
set -o errtrace #trap inherited in sub script
set -o errexit
set -o functrace #trap inherited in function

# set -x

# build 命令是。。。。。
# build 命令是。。。。。2
@build() {
  echo "in build: $*"
}


# run 命令是。。。。。
# run 命令是。。。。。2
@run() {
  return
}

listCmds() {
  # IFS=$'\n'指分配回车符给IFS
  IFS=$'\n'

  # declare -F 会列出所有定义, 我们要找出以@开头的函数，作为子命令
  # declare -f nvm_version_dir
  for f in $(declare -F); do
    local cmdName=${f:11}

    # 只有@开头的才认为是cmd
    if test ! "$(grep "^@" <<<"$cmdName")"; then  continue; fi

    # extdebug可以让 `declare -F`打印出文件和行号，比如：
    #   $ declare -F nvm_version
    #   -------------------------------------------
    #   nvm_version 536 /Users/cc/.nvm/nvm.sh
    local cmd; shopt -s extdebug; readarray -d " " -t cmd <<< "$( declare -F "$cmdName" )"

    # 取子命令的帮助：从cmd的lineNumber向上数，有注释的行都是帮助，直到非注释行
    readarray lines <<< "${cmd[2]}"
    echo -e "$cmdName ${#lines[@]}" ;
    for(( i=cmd[1]-2; i >0 ; i--  ))
    do
      # 到非#开头的行就停下
      # shellcheck disable=SC2046
      if test ! $(grep -E '^[ ]*#' <<< "${lines[$i]}") ; then
        break
      fi
      # shellcheck disable=SC2001
      line=$(sed 's/^[ ]*#//g' <<< "${lines[$i]}")
      echo "        ${line}"
    done
    echo

  done
  return
}
_help=$(
  cat <<END_HEREDOC
./bake 不想再用makefile了，父子命令就用这个就行了
----------------
$(listCmds)
----------------
END_HEREDOC
)

if [ "$#" == 0 ]; then
  echo "$_help"
  exit 0
fi

# shellcheck disable=SC2145
echo "[$@]"
"$@"
