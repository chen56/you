#!/usr/bin/env bash
set -o errtrace  # -E trap inherited in sub script
set -o errexit   # -e
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
#SCRIPT_FILE="$(basename "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../../common.bash"

# 函数多结果所面临的问题
函数多返回值问题() {

  print.markdown <<EOF
# bash 核心 - 命令行、字符串、分割符、转义

了解字符串，字符串分割，转义，是bash的核心

## 函数返回多个值怎么办

问题：有时候会写一个返回多值的函数，比如字符串分割函数，或某查询结果列表,
而调用方又要检索这个多值结果进一步处理，你就要仔细空格啊、换行啊、逗号分隔啊之类的鸟事。
EOF


  # 定义一个bash函数，用于分割字符串
  split_string() {
    # 获取传入的参数
    local input_string="$1"
    # 分割符
    local delimiter="$2"

    # 使用IFS（内部字段分隔符）临时设定分隔符，并将输入字符串分配给数组
    local IFS="${delimiter}"
    read -ra array <<<"${input_string}"

    # 返回分割后的数组
    echo "${array[@]}"
  }

  # 示例使用
  # 然后用函数结果再造数组：
  # shellcheck disable=SC2207
  result=($(split_string "hel lo:world" ":"))

  # 结果出人意料：数组有3个值，而不是希望的2个
  # shell让我又陷入智障
  # 因为split_string用空格分割的结果，回头再用x=(a b c)这种形式恢复的时候，空格就出来捣乱了
  echo "结果出人意料：数组有3个值，而不是希望的2个"
  declare -p result
  echo "我不定义数组了，我直接打出来行吗？"
  for idx in $(split_string "hel lo:world" ":"); do
      echo "result之一 = $idx"
  done
}



函数多返回值问题解决方案() {
  print.markdown <<EOF___

为什么批bash是一门丧心病狂的语言，就是因为它是个处理字符串的语言，这货基本不支持传递数据结构，
所以只要写函数，就要面对空格、换行、分割符这些让人智障的问题，哎。。。
当然聪明人用全局变量来传递结果，这。。。。当我没说，全局变量用来传递函数结果，很容易环境感染，带来其他问题，
某个bug查半天，哦这个变量被那谁谁谁覆盖了！

能解决智障吗？可以!

办法：返回一个数组严格定义文本，调用方再declare -a恢复：

EOF___

  # 定义一个bash函数，用于分割字符串
  split_string() {
    # 获取传入的参数
    local input_string="$1"
    # 分割符
    local delimiter="$2"

    # 使用IFS（内部字段分隔符）临时设定分隔符，并将输入字符串分配给数组
    local IFS="${delimiter}"
    read -ra array <<<"${input_string}"

    #####################
    ## 上面没变，看这里:
    #####################
    # declare -p array： 会显示array变量的定义形式：
    # 再把前缀'declare -a array'删掉就是要的：([0]=$'行1\n  行2\n  行3' [1]="另一个值")
    declare -p array | sed 's/^declare -a array=//'
  }

  # declare -a y :意思是定义一个array类型的变量y
  echo "调用declare -a恢复数组："
  declare -a result
  result="$(split_string 'hel lo:world' ':' )"
  declare -p result

  # 目前能想到的最简单省心的办法，妈妈再也不用担心我处理错换行、空格啥了。
}


# 入口
bake.go "$@"