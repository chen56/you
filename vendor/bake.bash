#!/usr/bin/env bash
set -o errtrace  # -E trap inherited in sub script
set -o errexit   # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail
#set -o nounset # -u: don't use it ,it is crazy, 1.bash version is diff Behavior 2.we need like this: ${arr[@]+"${arr[@]}"}

_bake_version=v0.3.20240327

# v0.2.20230528 - It can run normally on macos
# todo
#   1. 当前 无法判断错误命令：./bake no_this_cmd ,因为不知道这是否是此命令的参数，
#      需要设置设一个简单的规则：只有叶子命令才能正常执行，这样非叶子命令就不需要有参数
#   2. 当前 无法判断错误options：./bake --no_this_opt ,同上
#   3. 类似flutter run [no-]pub 反向选项
#
# bake == (bash)ake == 去Make的bash tool
# bake 是个简单的命令行工具，以替代Makefile的子命令功能
# make工具的主要特点是处理文件依赖进行增量编译，但flutter、golang、java、js项目的build工具
# 太厉害了，这几年唯一还在用Makefile的理由就是他的子命令机制: "make build"、
# "make run", 可以方便的自定义单一入口的父子命令，但Makefile本身的语法套路也很复杂，
# 很多批处理还是要靠bash, 这就尴尬了，工具太多，麻烦！本脚本尝试彻底摆脱使用Makefile。
# 经尝试，代码很少啊 ，核心代码几百行啊，父子命令二三百行左右，option解析二三百行左右，功能足够了：
#
# bake命令规则：
# 1. 函数即命令，所有bake内的函数均可以在脚本外运行：
#      ./bake [all function]     # bake内的所有函数均可以在脚本外直接运行
#      ./bake info               # 比如这个内部函数, 看bake内部变量，调试脚本用
#      ./bake test               # 你如果定义过test()函数，就可以这样运行
# 2. 带"."的函数，形成父子命令:
#    web.build(){ echo "build web app"; }
#    web.test(){ echo "build web app"; }
#   可以这样调用
#      ./bake web -h            # 运行子命令,或看帮助
#      ./bake web.build -h      # 上面等同
#      ./bake web test -h       # 运行子命令,或看帮助
#      ./bake web.test -h       # 与上面等同
# 3. 特殊的root命令表示根命令
#      ./bake                   # 如果有root()函数，就执行它
# 4. 像其他高级语言的cli工具一样，用简单变量就可以获取命令option:
#    # a. 先在bake文件里里定义app options
#      bake.opt --cmd build --name "target" --type string
#    # b. 解析和使用option
#      function build() {
#         eval "$(bake.parse "${FUNCNAME[0]}" "$@")";
#         echo "build ... your option：target: $target";
#      }
#    # c. 调用看看:
#      ./bake build --target "macos"
# 5. bake尽量不依赖bash以外的其他工具，包括linux coreutils,更简单通用,但由于用了关联数组等
#    依赖bash4+
# 6. 有两种用法：
#     - 这个文件copy走，把你的脚本放到本脚本最后即可.
#     - 在你的脚本里直接curl下载本脚本后 source即可。
# 范例可以看实际案例：
#     - https://github.com/chen56/note/blob/main/bake
#     - https://github.com/chen56/younpc/blob/main/bake


# check bake dependencies
if ((BASH_VERSINFO[0] < 4 || (\
  BASH_VERSINFO[0] == 4 && BASH_VERSINFO[1] < 4))); then
  echo "Error: It's 2082 ，Your bash is still this version(BASH_VERSINFO: ${BASH_VERSINFO[*]})，Please install bash 4.4+:
    apt install bash  # ubuntu
    brew install bash # mac"
  exit 1
fi
# On Mac OS, readlink -f doesn't work, so use.bake._real_path get the real path of the file
bake._real_path() (
  cd "$(dirname "$1")"
  file="$PWD/$(basename "$1")"
  while [[ -L "$file" ]]; do
    file="$(readlink "$file")"
    cd -P "$(dirname "$file")"
    file="$PWD/$(basename "$file")"
  done
  echo "$file"
)

# bake context
BAKE_PATH="$(bake._real_path "${BASH_SOURCE[0]}")"
BAKE_DIR="$(dirname "$BAKE_PATH")"
BAKE_FILE="$(basename "$BAKE_PATH")"
cd "${BAKE_DIR}" # set workdir
declare debug=false
declare help=false

bake._on_error() {
  bake._error "ERROR - trapped an error: ↑ , trace: ↓"
  local i=0
  local stackInfo
  while true; do
    stackInfo=$(caller $i 2>&1 && true) && true
    if [[ $? != 0 ]]; then return 0; fi

    # 一行调用栈 '97 bake.build ./note/bake'
    #    解析后 =>  行号no=97 , 报错的函数func=bake.build , file=./note/bake
    local no func file
    IFS=' ' read -r no func file <<<"$stackInfo"

    # 打印出可读性强的信息:
    #    => ./note/bake:38 -> bake.build
    printf "%s\n" "$(bake._real_path $file):$no -> $func" >&2

    i=$((i + 1))
  done
}
# Add the error catch first
#https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html#index-trap
trap "bake._on_error" ERR


# replace $HOME with "~"
# Usage: bake._pwd
# Examples: 当前目录如果是"/Users/chen/git/note/"
#     转成更简单易读的 => "~/git/note/"
bake._pwd() { echo "${PWD/#$HOME/\~}" ; }

# 报错后终止程序，类似于其他语言的throw Excpetion
# 因set -o errexit 后，程序将在return 1 时退出，
# 退出前被‘trap bake._on_error ERR’捕获并显示错误堆栈
# Usage: bake._throw <ERROR_MESSAGE>
bake._throw(){
  bake._error "$@"
  # set -o errexit 后，程序将退出，退出前被trap bake._on_error Err捕获并显示错误堆栈
  return 1
}
bake._error() {
  if [[ "${_LOG_LEVELS[@]:0}" != *"$LOG"* ]]; then return 0; fi
  bake._log "$@"
}
bake._info() {
  bake._log "$@"
}
bake._debug() {
  if [[ "${debug}" != true ]]; then return 0; fi
  bake._log "$@"
}
# Usage: bake._log DEBUG "错误消息"
bake._log(){
  local level;
  level=$1
  if [[ "${_LOG_LEVELS[@]:2}" != *"$LOG"* ]]; then return 0; fi
  echo -e "$level $(date "+%F %T") $(bake._pwd)\$ ${FUNCNAME[1]}() : $*" >&2
}


##########################################
# bake common script
##########################################

# Simulating object-oriented data structures with flat associative arrays
# use ./bake _self to see internal var
# save all other data
declare -A _bake_data

# only save all commands, we use it to build command tree
# it is cache cmd tree from _bake_data
declare -A _bake_cmds

TYPE_CMD="type:cmd"

##########################################
# bake common function
##########################################

# Usage: bake._str_cutLeft <str> <left>
# bake._path_dirname a/b/c  a/b    => c
bake._str_cutLeft() { printf "${1#$2}"; }

# Usage: bake.str.split <str> [delimiter:default /]
bake._str_split() {
  local str=$1 delimiter=${2:-/}
  #  # use <() process-substitution
  #  # don't use <<< "" its add newline
  local arr
  readarray -t arr < <(printf '%s' "${str//$delimiter/$'\n'}")
  printf '%s\n' "${arr[@]}"
}

# Usage: bake._str_revertLines <<< "$(echo -e "a\nb\nc")"  => "c\nb\na"
bake._str_revertLines() {
  # cat xxx | tail -r; # macos bsd only, not work on linux
  # so use sed
  sed '1!G;h;$!d' # sed magic
}

# Usage: bake._path_dirname <str> [delimiter:default /]
# similar command dirname, but
#     dirname root is ".", only work with "/"
#     bake._path_dirname root is "" , can set delimiter
# bake._path_dirname a.b.c .    => a.b
bake._path_dirname() {
  local pathLikeStr="$1" delimiter="${2:-/}"
  if [[ "$pathLikeStr" != *"$delimiter"* ]]; then
    return
  fi
  printf '%s' "${pathLikeStr%$delimiter*}"
}
# Usage: bake._path_first <str> [delimiter:default /]
# bake._path_first a.b.c .    => a
bake._path_first() {
  local pathLikeStr="$1" delimiter="${2:-/}"
  # if /a/b/c , call :bake._path_first a/b/c /
  if [[ "$pathLikeStr" == "$delimiter"* ]]; then
    local removeDelim
    removeDelim=$(bake._str_cutLeft "$pathLikeStr" "$delimiter")
    printf "$delimiter$(bake._path_first "$removeDelim" "$delimiter")"
  else # a/b/c
    printf "${pathLikeStr%%$delimiter*}"
  fi
}
# similar command basename
# Usage: bake._path_basename <str> [delimiter:default /]
bake._path_basename() {
  local pathLikeStr="$1" delimiter="${2:-/}"
  # ${1##*/}  => ## left remove until last "/"
  printf "${pathLikeStr##*$delimiter}"
}

# Usage: bake._data_children <dataPath>
#   return <dataPath> children name
bake._data_children() {
  local path="$1"
  # ${!_bake_data[@]}: get all array keys
  local key
  for key in "${!_bake_data[@]}"; do
    # if start $path
    if [[ "$key" == "$path"* ]]; then
      # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
      # remove prefix : key:build/opts/dir/type/x leftPathToBeCut:build/opts => dir/type/x
      local child=$(bake._str_cutLeft "$key" "$path/")
      # remove suffix:  dir/type/x => dir
      child=$(bake._path_first "$child" "/")
      printf '%s\n' "$child"
    fi
  done | sort -u
}

bake._cmd_childrenNameMaxLength() {
  local cmd="$1" maxLengthOfCmd=0
  for child in $(bake._cmd_children "$cmd"); do
    if ((${#child} > maxLengthOfCmd)); then maxLengthOfCmd=${#child}; fi
  done
  printf "$maxLengthOfCmd"
}
bake._cmd_children() (
  local path="$1"
  if [[ "$path" == root ]]; then
    path=""
  fi

  # ${!_bake_data[@]}: get all array keys
  for key in "${!_bake_cmds[@]}"; do
    # if start $path
    if [[ "$key" == "$path"* && "$key" != "$path" && "$key" != "root" ]]; then
      # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
      # remove prefix : key:a.b.c leftPathToBeCut:a => b.c
      child=$(bake._str_cutLeft "$key" "$path.")
      # remove suffix:  b.c => c
      child=$(bake._path_first "$child" ".")
      printf '%s\n' "$child"
    fi
  done | sort -u
)

# Usage: bake._cmd_up_chain <cmd>
# sample: bake._cmd_up_chain a.b      => "a.b", "a", "root"
bake._cmd_up_chain() {
  local path="${1:-root}"
  local up="$path"
  while [[ "$up" != "" ]]; do
    printf '%s\n' "$up"
    up=$(bake._path_dirname "$up" ".")
  done
  if [[ "$path" != "root" ]]; then printf "root\n"; fi
}
# Usage: bake._cmd_down_chain <cmd>
# reverse of bake._cmd_up_chain
bake._cmd_down_chain() {
  bake._cmd_up_chain "$1" | bake._str_revertLines
}

# Usage: bake._opt_cmd_chain_opts <cmd>
# Examples: bake._opt_cmd_chain_opts bake.info
# return optionDataPath list
bake._opt_cmd_chain_opts() {
  local cmd=$1
  local upCmds
  readarray -t upCmds <<<"$(bake._cmd_up_chain "$cmd")"

  local key
  for key in "${!_bake_data[@]}"; do
    if [[ "${_bake_data["$key"]}" != "type:opt" ]]; then continue; fi
    local upCmd
    for upCmd in "${upCmds[@]}"; do
      if [[ "$key" == "$upCmd/opts/"* ]]; then
        printf '%s\n' "$key"
      fi
    done
  done | sort
}

# only use by bake.opt,
# because "bake.opt" is meta function, use this func to add self
bake._opt_internal_add() {
  local cmd="$1" opt="$2" type="$3" required="$4" default="$5" abbr="$6" desc="$7"
  _bake_data["$cmd/opts/$opt"]="type:opt"
  _bake_data["$cmd/opts/$opt/name"]="$opt"
  _bake_data["$cmd/opts/$opt/type"]="$type"
  _bake_data["$cmd/opts/$opt/required"]="$required"
  _bake_data["$cmd/opts/$opt/abbr"]="$abbr"
  _bake_data["$cmd/opts/$opt/default"]="$default"
  _bake_data["$cmd/opts/$opt/desc"]="$desc"
}


# Usage: bake._cmd_register
# ensure all cmd register
bake._cmd_register() {
  local functionName

  while IFS=$'\n' read -r functionName; do
    if [[ "$functionName" == */* ]]; then
      echo "error: function $functionName() can not contains '/' " >&2
      return 1
    fi
    local upCmd
    for upCmd in $(bake._cmd_up_chain "$functionName"); do
      # if upCmd is a function , set upCmd value to data path
      if compgen -A function | grep -q "^$upCmd$"; then
        _bake_cmds["$upCmd"]="$upCmd"
      else
        _bake_cmds["$upCmd"]="PARENT_CMD_NOT_FUNC"
      fi
    done

    # list all function name
    # declare -F | awk {'print $3'} == compgen -A function
    # declare -f func1  -> func1
    # declare -fx func2 -> func2
#  done <<<"$(compgen -A function)"
  done <<<"$(declare -F | grep "declare -f" | awk {'print $3'})"
}

# 显示一条命令的帮助
# Usage: bake._show_cmd_help <CMD>
# Examples: bake._show_cmd_help deploy #显示deploy的帮助:
bake._show_cmd_help() {
  local cmd="$1"

  if [[ "$cmd" == "" ]]; then
    bake._throw "bake._show_cmd_help need a arg: bake._show_cmd_help [cmd]"
  fi

  shift

  eval "$(bake.parse "${FUNCNAME[0]}" "$@")"

  echo

  if [[ "$cmd" == "root" ]] ;then
      echo "Running:【: $(bake._pwd)/$BAKE_FILE $@】"
  else
      echo "Running:【$(bake._pwd)/$BAKE_FILE $cmd $@】"
  fi

  echo
  echo "${_bake_data["${cmd}/desc"]}"
  echo

  echo "Available Options:"
  for optPath in $(bake._opt_cmd_chain_opts "$cmd"); do
    local opt=$(bake._path_basename "$optPath")
    local name=${_bake_data["$optPath/name"]}
    local type=${_bake_data["$optPath/type"]}
    local required=${_bake_data["$optPath/required"]}
    local abbr=${_bake_data["$optPath/abbr"]}
    local default=${_bake_data["$optPath/default"]}
    local desc="${_bake_data["$optPath/desc"]}"

    local optArgDesc=""
    if [[ "$type" == "string" ]]; then
      if [[ "$default" != "" ]]; then
        optArgDesc+="<$type:${default}>"
      else
        optArgDesc="<$type>"
      fi
    fi

    printf " --%-20s -%-2s %-6s required:[%s] %b\n" "$name $optArgDesc" "$abbr" "$type" "$required" "$desc"
  done

  echo "
Available Commands:"
  local maxLengthOfCmd
  maxLengthOfCmd="$(bake._cmd_childrenNameMaxLength "$cmd")"

  for subCmd in $(bake._cmd_children "$cmd"); do

    # only show public cmd if not verbose
    # '_'起头的命令和'bake'命令，只有debug模式才打印出来
    if [[ ("$subCmd" == _* || "$subCmd" == bake*)  ]]; then
      if [[  "$debug" != "true" ]]; then
        continue
      fi
    fi

    local subCmdPath="$cmd/$subCmd"
    [[ "$cmd" == "root" ]] && subCmdPath="$subCmd"

    local desc="${_bake_data["$subCmdPath/desc"]}"
    desc="$(echo -e "$desc" | head -n 1 )" #  backslash escapes interpretation

    printf "  %-$((maxLengthOfCmd))s  ${desc}\n" "${subCmd}"
  done
}


# 为cmd配置参数(public api)
# Examples:
#   bake.opt --cmd "build" --name "is_zip" --type bool --required --abbr z --default true --desc "is_zip, build项目时是否压缩"
# 每个参数可以配置如下信息：
#   cmd: 参数作用的命令全名
#   name: 参数长名，可以 ./bake build --is_zip 这样使用
#   type: 类型，目前支持 bool|string|list
#   required: 是否必须提供，不提供将报错
#   abbr: 参数短名, 可以 ./bake build -z 这样使用
#   default: 缺省值, 未指定参数时，使用此值
#   desc: 参数帮助，将显示在‘./bake build -h’命令帮助里
# 参考[bake.parse]
bake._opt_internal_add bake.opt "cmd"      "string" "true"  ""      ""      "cmd name"
bake._opt_internal_add bake.opt "name"     "string" "true"  ""      ""      "option name"
bake._opt_internal_add bake.opt "type"     "string" "true"  ""      ""      "option type [bool|string|list]"
bake._opt_internal_add bake.opt "required" "bool"   "false" "false" "false" "option required [true|false],default[false]"
bake._opt_internal_add bake.opt "abbr"     "string" "false" ""      ""      "option abbr"
bake._opt_internal_add bake.opt "default"  "string" "false" ""      ""      "option abbr"
bake._opt_internal_add bake.opt "desc"  "string" "false" ""      ""      "option desc"
bake.opt() {
  eval "$(bake.parse ""${FUNCNAME[0]}"" "$@")"
  if [[ "$name" == "" ]]; then
    echo "error: option [--name] required " >&2 && return 1
  fi
  if [[ "$type" == "" ]]; then
    echo "error: option [--type] required " >&2 && return 1
  fi
  if [[ "$type" != "bool" && "$type" != "string" && "$type" != "list" ]]; then
    echo "error: option [--type] must in [bool|string|list] " >&2 && return 1
  fi
  bake._opt_internal_add "$cmd" "$name" "$type" "${required:-false}" "$default" "$abbr" "$desc"
}

# bake.opt  (public api)
# 像其他高级语言的cli工具一样，用简单变量就可以获取名称化的命令参数:
# 支持bool,string,list三种参数，用法如下：
# 你的./bake脚本里：
#      bake.opt --cmd build --name "is_zip" --type bool
#      bake.opt --cmd build --name "target" --type string
#      bake.opt --cmd build --name "files"  --type string
#      function build() {
#         # 模版代码，把生成的脚本eval出来
#         eval "$(bake.parse "${FUNCNAME[0]}" "$@")";

#         echo "is_zip:$is_zip, target:$target, hosts:${hosts[@]}";
#      }
#  调用：
#      ./bake build --target "macos" --is_zip --host host1 --host2
#  调用结果是'bake.parse "${FUNCNAME[0]}" "$@"'将生成如下脚本:
#  ---------------------------------------------------------
#  declare is_zip=true;
#  declare target="macos";
#  declare hosts=("host1" "host2");
#  declare optShift=7;
#  ---------------------------------------------------------
# eval后，就可以直接使用变量了, 在函数中declare，不带-g参数默认为local变量，不会影响全局环境。
#
# Usage: bake.parse <cmd:default root> [arg1] [arg2] ...
# 参考：[bake.opt]
bake.parse() {
  local cmd="${1}"
  if [[ "$cmd" == "" ]]; then
    bake._throw "bake.parse函数需提供cmd参数, Usage: bake.parse <cmd:default root> [arg1] [arg2]" ;
  fi

  shift; # shift cmd arg, left is options

  # key is -h --help ... candidate words ,
  # value is optPath
  declare -A allOptOnCmdChain
  # collect opt from command chain : root>pub>pub.get
  #   root option first , priority low -> priority high:
  for optPath in $(bake._opt_cmd_chain_opts "$cmd" | bake._str_revertLines); do
    local opt
    opt=$(bake._path_basename "$optPath")
    local abbr
    abbr=${_bake_data["$optPath/abbr"]}
    allOptOnCmdChain["--$opt"]="${optPath}"
    if [[ "$abbr" != "" ]]; then allOptOnCmdChain["-$abbr"]="${optPath}"; fi
  done

  # dynamic opt variable map : optPath:optVarName
  # Why use dynamic variables: because the variable name is not fixed
  # and We want to manipulate arrays(list type opt) more conveniently
  local -A optVars
  local totalArgs="$#"
  # while all args , until it is not opt
  while (($# > 0)); do
    # match $1 arg in allOptOnCmdChain, guess $1 is a "-h" "-help" ...
    local optPath
    optPath=${allOptOnCmdChain["$1"]}
    # if next arg not a opt , parsing complete;
    if [[ "${optPath}" == "" ]]; then break; fi

    # _opt_value_ prefix : avoid conflicts in the current context
    optVars["$optPath"]="_opt_value_$(bake._path_basename "$optPath")"
    declare "${optVars["$optPath"]}"
    # reference to the current dynamic  opt variable
    declare -n currentOptValue=${optVars["$optPath"]}

    local optType=${_bake_data["$optPath/type"]}
    case $optType in
    bool)
      currentOptValue=true
      shift 1
      ;;
    string)
      [[ ! "${2+declare}" ]] && echo "parse error: opt need a value: $arg <value> " >&2 && return 1
      currentOptValue="$2"
      shift 2
      ;;
    list)
      [[ ! "${2+declare}" ]] && echo "parse error: opt need a value: $arg <value> " >&2 && return 1
      currentOptValue+=("$2") # array add
      shift 2
      ;;
    *)
      echo "parse error: not support $optPath.type: <$optType> " >&2
      return 1
      ;;
    esac
  done

  local resultStr
  for optPath in "${!optVars[@]}"; do
    local declareStr
    declareStr=$(declare -p "${optVars["$optPath"]}")
    resultStr+="${declareStr/#*_opt_value_/declare };\n"
  done
  resultStr+="declare optShift=$((totalArgs - $#));\n"
  echo -e "$resultStr" # echo -e : unescapes backslash
}


# bake.cmd  (public api)
# 注册一个命令的帮助信息
# Examples:
#   bake.cmd --cmd build --desc "build project"
# 尤其是可以配置root命令以定制根命令的帮助信息，比如:
#   bake.cmd --cmd root \
#             --desc "flutter-note cli."
# 这样就可以用'./your_script -h' 查看根帮助了
bake.opt --cmd "bake.cmd" --name "cmd"         --type string --desc "cmd, function name"
bake.opt --cmd "bake.cmd" --name "desc"     --type string --desc "cmd desc, show in help"
bake.cmd() {
  # 模版代码，放到每个需要使用option的函数中，然后就可以使用option了
  eval "$(bake.parse "${FUNCNAME[0]}" "$@")"

  if [[ "$cmd" == "" ]]; then
    echo "error: bake.cmd [--cmd] required " >&2
    return 1
  fi
  _bake_data["$cmd/desc"]="$desc"
}


# list bake var info(public api),use for debug
# Usage: info
bake.info() {

cat <<- EOF

 .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. |
| |   ______     | || |      __      | || |  ___  ____   | || |  _________   | |
| |  |_   _ \    | || |     /  \     | || | |_  ||_  _|  | || | |_   ___  |  | |
| |    | |_) |   | || |    / /\ \    | || |   | |_/ /    | || |   | |_  \_|  | |
| |    |  __'.   | || |   / ____ \   | || |   |  __'.    | || |   |  _|  _   | |
| |   _| |__) |  | || | _/ /    \ \_ | || |  _| |  \ \_  | || |  _| |___/ |  | |
| |  |_______/   | || ||____|  |____|| || | |____||____| | || | |_________|  | |
| |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'

EOF
  echo '# bake info & internal var'
  echo
  echo '## _bake_cmds'
  echo
  for key in "${!_bake_cmds[@]}"; do
    printf "cmd  - %-40s = %q\n" "$key" "${_bake_cmds["$key"]:0:100}"
  done | sort
  echo
  echo '## _bake_data'
  echo
  for key in "${!_bake_data[@]}"; do
    printf "data - %-40s = %q\n" "$key" "${_bake_data["$key"]:0:100}"
  done | sort
  echo
  echo '## options'
  echo
  echo "help   = $help"
  echo "debug  = $debug"
  echo

}

# 入口 (public api)
bake.go() {
  # init register all cmd

  bake._cmd_register

  # parse cmd :
  #   ./bake pub get -v -b
  #     -> { cmd:"pub.get", args:"-v -b" }
  #   ./bake -h
  #     -> { cmd:"", args:"-h" }
  local cmd nextCmd arg
  for arg in "$@"; do
    nextCmd="$([[ "$cmd" == "" ]] && echo "$arg" || echo "$cmd.$arg")"
    if [[ "${_bake_cmds["$nextCmd"]}" == "" ]]; then break; fi
    cmd="$nextCmd"
    shift
  done

  if [[ "$cmd" == "" ]]; then cmd="root"; fi
  eval "$(bake.parse "$cmd" "$@")"

  if [[ "$help" == "true" ]]; then
    bake._show_cmd_help "$cmd" "$@"
    return 0
  fi

  #  if fileExist then show help
  if ! declare -F "$cmd" | grep "$cmd" &>/dev/null  2>&1; then
    if [[ "${_bake_cmds["$cmd"]}" == "PARENT_CMD_NOT_FUNC" ]]; then
      bake._show_cmd_help "$cmd" "$@"
      return 0
    fi
    bake._throw "Error: 404 ,cmd '${cmd}' not define, please define cmd function '${cmd}()'"
  fi

  $cmd "$@"
}

# root is special cmd(you can define it), bake add some common options to this cmd, you can add yourself options
bake.opt --cmd root --name "help"    --abbr h --type bool   --default false --desc "print help, show all commands"
bake.opt --cmd root --name "debug"   --abbr d --type bool   --default false  --desc "debug mode, print more internal info"

# BASH_SOURCE > 1 , means bake import from other script, it is lib mode
# lib mod is not load app function, so we need to stop here
if ((${#BASH_SOURCE[@]} > 1)); then
  bake._debug "【${BAKE_FILE}】 call by other script【$(printf " ▶︎ %s" "${BASH_SOURCE[@]}")】, lib mode on, not load below app script" >&2
fi

# bake内部版本(public api)
bake.version(){
  echo "$_bake_version"
}

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# bake common script end line.
# The above code is common code that is not related to the specific app,
# if you want to define app-related commands,
# please put them below or other file.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!