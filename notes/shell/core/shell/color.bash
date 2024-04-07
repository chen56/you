#!/usr/bin/env bash
set -o errtrace  # -E trap inherited in sub script
set -o errexit   # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail

# 模版代码，获取文件真实路径
# On Mac OS, readlink -f doesn't work, so use._real_path get the real path of the file
_real_path() {  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}" ; }

SCRIPT_PATH="$(_real_path "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

source "$SCRIPT_DIR/../../common.bash"


colors_list() {
  print.markdown <<EOF
  # shell colors

  shell颜色

EOF
#!/bin/bash

  # 声明关联数组来存储颜色
  declare -A bg_colors

   # 基本8色的前景色
   declare -A BASIC_FOREGROUND_COLORS=(
       [black]="\033[30m"   # 黑色
       [red]="\033[31m"     # 红色
       [green]="\033[32m"   # 绿色
       [yellow]="\033[33m"  # 黄色
       [blue]="\033[34m"    # 蓝色
       [magenta]="\033[35m" # 洋红
       [cyan]="\033[36m"    # 青色
       [white]="\033[37m"   # 白色
   )

   # 基本8色的背景色
   declare -A BASIC_BACKGROUND_COLORS=(
       [black]="\033[40m"   # 黑色
       [red]="\033[41m"     # 红色
       [green]="\033[42m"   # 绿色
       [yellow]="\033[43m"  # 黄色
       [blue]="\033[44m"    # 蓝色
       [magenta]="\033[45m" # 洋红
       [cyan]="\033[46m"    # 青色
       [white]="\033[47m"   # 白色
   )

   # 明亮8色的前景色
  declare -A BRIGHT_FOREGROUND_COLORS=(
       [black]="\033[90m"   # 亮黑色（通常是深灰色）
       [red]="\033[91m"     # 亮红色
       [green]="\033[92m"   # 亮绿色
       [yellow]="\033[93m"  # 亮黄色
       [blue]="\033[94m"    # 亮蓝色
       [magenta]="\033[95m" # 亮洋红
       [cyan]="\033[96m"    # 亮青色
       [white]="\033[97m"   # 亮白色
   )

   # 明亮8色的背景色
   declare -A BRIGHT_BACKGROUND_COLORS=(
       [black]="\033[100m"  # 亮黑色背景（通常是深灰色）
       [red]="\033[101m"    # 亮红色背景
       [green]="\033[102m"  # 亮绿色背景
       [yellow]="\033[103m" # 亮黄色背景
       [blue]="\033[104m"   # 亮蓝色背景
       [magenta]="\033[105m" # 亮洋红背景
       [cyan]="\033[106m"   # 亮青色背景
       [white]="\033[107m"  # 亮白色背景
   )

   # 重置颜色为默认
   RESET_COLOR="\033[0m"

   # 使用示例
   echo -e "${BASIC_FOREGROUND_COLORS[red]}Basic Red Text${RESET_COLOR}"
   echo -e "${BASIC_BACKGROUND_COLORS[green]}Basic Green Background${RESET_COLOR}"
   echo -e "${BRIGHT_FOREGROUND_COLORS[blue]}Bright Blue Text${RESET_COLOR}"
   echo -e "${BRIGHT_BACKGROUND_COLORS[cyan]}Bright Cyan Background${RESET_COLOR}"


  # 打印带有前景色和背景色的文本
  echo -e "${BASIC_FOREGROUND_COLORS[blue]}${BASIC_FOREGROUND_COLORS[green]}蓝字,绿背景${RESET_COLOR}"
  # shellcheck disable=SC2016
  echo -e 'reset 只要前景色就可以: ${colors[reset]}'

  echo "==============================前景色$"
  for color in "${!BASIC_FOREGROUND_COLORS[@]}"; do
      fg="${BASIC_FOREGROUND_COLORS[$color]}"
      fg_bright="${BRIGHT_FOREGROUND_COLORS[$color]}"
      echo -e "${fg} 基本前景色 ${RESET_COLOR} | ${fg_bright} 明亮前景色,   ${RESET_COLOR}"
  done
  echo "==============================背景色$"
  for color in "${!BASIC_BACKGROUND_COLORS[@]}"; do
      bg="${BASIC_BACKGROUND_COLORS[$color]}"
      bg_bright="${BRIGHT_BACKGROUND_COLORS[$color]}"
      echo -e "${bg} 基本前景色 ${RESET_COLOR} | ${bg_bright} 明亮前景色,   ${RESET_COLOR}"
  done
  echo "==============================前景背景一起$"
  for color in "${!BASIC_BACKGROUND_COLORS[@]}"; do
      fg="${BASIC_FOREGROUND_COLORS[$color]}"
      fg_bright="${BRIGHT_FOREGROUND_COLORS[$color]}"
      bg="${BASIC_BACKGROUND_COLORS[$color]}"
      bg_bright="${BRIGHT_BACKGROUND_COLORS[$color]}"

      echo -e "$bg${fg} 基本前景色 ${RESET_COLOR} | $bg_bright${fg_bright} 明亮前景色,   ${RESET_COLOR}"
  done
}

# 颜色梯度问题
function color__GRADIENTS() {

  # 预定义的颜色梯度数组（这里只定义了蓝色）
  declare -A BLUE_GRADIENTS=(
      [1]="\033[38;2;0;0;255m"    # 最浅的蓝色
      [2]="\033[38;2;0;50;255m"   # 稍深的蓝色
      [3]="\033[38;2;0;100;255m"  # 更深的蓝色
      [4]="\033[38;2;0;150;255m"  # 更深的蓝色
      [5]="\033[38;2;0;255;255m"  # 最深的蓝色（接近黑色）
  )
  colors=(
    [blue]="033[38;2;0;0;255m"    # 最浅的蓝色
                                  # 最浅的蓝色
  )

  # 重置颜色为默认
  RESET='\033[0m'

  # 使用示例
  for color in "${BLUE_GRADIENTS[@]}"; do
    echo -e "${color} color:$color  $RESET"
  done

}


# 入口
bake.go "$@"

