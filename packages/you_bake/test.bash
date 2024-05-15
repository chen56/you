#!/usr/bin/env bash
set -o errtrace # -E trap inherited in sub script
set -o errexit # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail
#set -o nounset # -u: don't use it ,it is crazy, 1.bash version is diff Behavior 2.we need like this: ${arr[@]+"${arr[@]}"}

########################################################
# 本测试命令和使用普通bake 应用脚本的模式一模一样
# 运行测试:   ./tests.bash test
# 列出子命令: ./tests.bash -h
########################################################


bake.__real_path() {  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}" ; }

TEST_PATH="$(bake.__real_path "${BASH_SOURCE[0]}")"
TEST_DIR="$(dirname "$TEST_PATH")"
TEST_FILE="$(basename "$TEST_PATH")"

source "$TEST_DIR/bake.bash"


_________________________test_framework_start(){ echo x;}

assert_fail() {
  echo "$@" >&2
}


@is(){


  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != "$expected" ]] ; then
    local error_message;
    # shellcheck disable=SC2261
    error_message=$(cat <<ERROR_END
================================================================================
error           : $msg
----------------------------------<先看看echo -e的内容>---------------------------
expected: [$(echo -e "$expected")]
actual  : [$(echo -e "$actual")]
----------------------------------<再看看echo -E的结果----------------------------
expected: [$(echo -E "$expected")]
actual  : [$(echo -E "$actual")]
-----------------------------------<diff>----------------------------------------
$( diff -y <(echo -E "$expected") <(echo -E "$actual") || true )
================================================================================

ERROR_END
)
    echo -E "$error_message" >&2

    echo "$-:assert fail, is open vimdiff check details: (y|yes)"
    # shellcheck disable=SC2154
    # __interactive is root option
    if [[ "$__interactive" == true ]];then
      IFS= read -p "进入vimdiff看细节？打开vimdiff输入(y|Y)" -n 1 -r is_open_diff
      if [[ "$is_open_diff" == "y" || "$is_open_diff" == "Y" ]]; then
        vimdiff <(echo -E "$expected") <(echo -E "$actual")
      fi
    fi
     # TODO 应该自己打印堆栈，指出出错的test，这需要定制返回值为4xx
     return 100
  fi
}
@contains(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != *"$expected"* ]] ; then
    assert_fail "assert fail: $msg
     actual         : [$actual]
     is not contains: [$expected]"
     return 2
  fi
}


# Usage: assert <actual> <assert_op_func> <expected> [msg]
# Sample: assert $(( 1+1 )) @is "2"
assert(){
  local actual="$1" op="$2" expected="$3" msg="$4"
  "$op" "$actual" "$expected" "$msg"
}



______________________________some_lib(){ echo x;}

# 这里放一些以后可能用到的函数，暂时未实验好


# escape to 'xxx' or $'xxx'
#  https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting
bake.str_escape() {
  #  from 2016 bash 4.4
  #  ${parameter@Q} : quoted in a format that can be reused as input
  # to 'xxx' or $'xxx'
  printf '%s\n' "${1@Q}"
}
# unescape from 'xxx' or $'xxx'
bake.str_unescape() {
  local str=${1}
  # $'xx' => xx
  if [[ "$str" == "\$'"*"'" ]]; then
    str="${str:2:-1}"
  # 'xx' => xx
  elif [[ "${str}" == "'"*"'" ]]; then
    str="${str:1:-1}"
  fi
  #  from 2016 bash 4.4
  #  ${parameter@E} expanded as with the $'...' quoting mechansim
  printf '%s' "${str@E}"
}

# TODO 模仿http错误
# 报错后终止程序，类似于其他语言的_throw Excpetion
# 因set -o errexit 后，程序将在return 1 时退出，
# 退出前被‘trap bake.__on_error ERR’捕获并显示错误堆栈
# Usage: _throw <http_error_code> <ERROR_MESSAGE>
_shell_code_to_http_code(){ return $(($1 + 200)) ; }
_http_code_to_shell_code(){ return $(($1 - 200)) ; }
_todo_throw(){
  local http_code="$1";
  local running_info="${SCRIPT_PATH} -> ${FUNCNAME[1]} ▶︎【$*】"
  if ! (( http_code >301 && http_code <=555  )); then
     echo "$running_info "
     echo "  => error : http_code参数要在301~555之间，模仿http状态码, Usage: _throw <http_code> <ERROR_MESSAGE>"
     return "$(_http_code_to_shell_code "$http_code")"
  fi
  shift
  echo "$running_info"
  # set -o errexit 后，程序将退出，退出前被trap bake.__on_error Err捕获并显示错误堆栈
  return "$(_http_code_to_shell_code "$http_code")"
}

______________________________study_start(){ echo x;}

# IFS : https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_05
tests.study_string_escape(){
  # $'' 语法
  assert $'1\n2' @is '1
2'
  assert '1\n2' @is '1\n2'

  assert $'1
2' @is $'1\n2'

  x="1
2"
  assert "$(printf '%q' "$x" )" @is "$'1\n2'"

  assert "$(printf '%q' "$x" )" @is $(echo -n "${x@Q}")
}

study.read(){
  local expected="";
  echo -e "1\n2" | while read -r x ; do
    expected+="$1,"
  done
  assert "$expected" @is '1,2,'
}
study.function_return(){
  (
    s(){
      printf "%s" "a b
c d";
    }
    str="$(s)"
    assert "${str}" @is $'a b\nc d'
    printf "${str}" | od -c -td1
    read -a arr <<< "${str}"
        assert "${#arr[@]}" @is 2
  )

  (
    # 需重新构造更清洗的用例
    q(){
      printf "%q" "a b
c d";
    }
    str="$(q)"
    assert "${str}" @is "$'a b\nc d'"
    # od：这是一个用来查看文件或其他输入的八进制或十六进制表示形式的工具。在这个例子中，使用 -c 参数告诉 od 以字符形式显示输入，
    # 每个字符及其对应的ASCII码或Unicode码都会被展示出来。-t d1 表示输出格式为十进制 (d)，
    # 每个字节视为一个单位 (1)，因此对于ASCII字符，这将显示每个字符对应的十进制ASCII码。
    echo "${str}" | od -c -td1
    assert "$(printf '%q' "$str")" @is "$'a b\nc d'"



    read -a arr <<< "${str}"
    # read 按IFS默认$' \n\t'，即用<space>, <newline>,<tab>分词
    # 由于printf "%q"会对非打印字符进行转义，<newline>已经被转为\和n，所以read分词时，
    # 并没有任何<newline>
    assert "${#arr[@]}" @is 3
    assert "$(printf '[%s]' "${arr[@]}" )" @is "[$'a][bnc][d']"

    IFS=$'\n' read -a arr <<< "${str}"
    # 我们重设分词符号只有$'\n', 但其实<newline>已被转义，所以并没有任何<newline>
    assert "${#arr[@]}" @is 1
    assert "$(printf '[%s]' "${arr[@]}" )" @is "[$'a bnc d']"

    # 函数的开发者有职责自己先区分好，我这个函数的输出，什么算是1行，算是1行的，就用printf "%q"转义
    # 那么，函数的调用者就有机会决定怎么分词
    # 函数的调用者有职责，对函数返回的字符串，自己先区分好，我拿到的函数输出，要不要分行处理
    # 就用IFS=$'\n' read -a arr <<< "${str}"分词
  )
}
# Usage: pipe <callback> [args...]
# callback: callback <line>
# Sample: cat file | pipe echo
study.pipe(){
  local func="$1" ; shift;
  for arg in "$@"; do
  $func "$arg"
  done
  if ! [[ -t 0 ]]; then
    while  read line; do
      $func "$line"
    done
  fi
}

____________________________test_start(){ echo x;}

tests.api_cmd_parse(){
  bake.opt --cmd "tests.api_cmd_parse" --long stringOpt --type string
  bake.opt --cmd "tests.api_cmd_parse" --long boolOpt --type bool
  bake.opt --cmd "tests.api_cmd_parse" --long listOpt --type list

  assert "$(bake.parse  --boolOpt )" @is 'declare -- __boolOpt="true"
shift 1'
  assert "$(bake.parse  --stringOpt "1 2" )" @is 'declare -- __stringOpt="1 2"
shift 2'

  # list type option
  assert "$(bake.parse  --listOpt "a 1" --listOpt "b 2" )" @is 'declare -a __listOpt=([0]="a 1" [1]="b 2")
shift 4'


  # no exists option
  assert "$(bake.parse   --no_exists_opt)" @is "shift 0"
}

tests.api_opt(){
  bake.opt --cmd "tests.opt.add" --long boolopt --type bool
}

tests.api_opt_value_parse_and_get_value(){
  bake.opt --cmd "tests.api_opt_value_parse_and_get_value" --long xxx --type string

  # 模拟shell参数
  set -- --xxx chen
  eval "$(bake.parse  "$@")"
  # shellcheck disable=SC2154
  assert "$__xxx" @is "chen"
}


function tests.str_escape() {
    assert "$(bake.str_escape $'1' )"     @is "'1'"
    assert "$(bake.str_escape $'1 ')"     @is "'1 '"
    assert "$(bake.str_escape $'1 2 "')"  @is "'1 2 \"'"
    assert "$(bake.str_escape $'1 "')"    @is "'1 \"'"
    assert "$(bake.str_escape $'1 2\n')"  @is "\$'1 2\n'"
}
function tests.str_unescape() {
    assert "$(bake.str_unescape "$(bake.str_escape $'1'    )")"      @is $'1'
    assert "$(bake.str_unescape "$(bake.str_escape $'1 2'  )")"      @is $'1 2'
    assert "$(bake.str_unescape "$(bake.str_escape $'1 " ' )")"      @is $'1 " '
    assert "$(bake.str_unescape "$(bake.str_escape $'1 \n ' )")"     @is $'1 \n '
}

# shellcheck disable=SC2046
# shellcheck disable=SC2031
# shellcheck disable=SC2016
study.declare(){

  (
    declare a=1 b=2
    assert "$a" @is "1"
    assert "$b" @is "2"
  )

  (
    # dynamic declare
    s='a=1 b=2'
    declare $(printf "%s" "$s")
    assert "$a" @is "1"
    assert "$b" @is "2"
  )
  (
    s='a=1 b=2'
    declare $(printf "%s" "$s")
    assert "$a" @is "1"
    assert "$b" @is "2"
  )

  (
    # declare ansi c quoting $''
    declare $'a=1 2'
    assert "$a" @is "1 2"

    # but not work with real ansi c quoting
    err=$( declare $(printf "%s" "a=$'1 2'") 2>&1  ) || true
    assert "$err" @contains "2'': not a valid identifier"

  )

  (

    IFS=$'\n'
    declare $(printf "%s" "a=$'1 2'
b=$'3 4'")
    assert "$a" @is "$'1 2'"
    assert "$b" @is "$'3 4'"
  )

  (
    # 目前看declare的脚本注射是比较安全的
    # "|| true" 防止set -o errexit
    err=$( declare $(printf "%s" 'a=1 b=2 ls -al -- ll') 2>&1  ) || true
    assert "$err" @contains "-al': not a valid identifier"

    err=$( declare $(printf "%s" 'a=$(ls -al)') 2>&1  ) || true
    assert "$err" @contains "-al)': not a valid identifier"

    err=$( declare $(printf "%s" 'a=b $(ls)=x') 2>&1  ) || true
    assert "$err" @contains $"ls)=x': not a valid identifier"

    err=$( declare $(printf "%s" 'a=b `ls`=x') 2>&1  ) || true
    assert "$err" @contains "=x': not a valid identifier"
  )

}

# shellcheck disable=SC2046
# shellcheck disable=SC2031
# shellcheck disable=SC2016

# eval 用起来比declare 省心多了
study.eval(){
  (
    eval "a=$'1 2' b=$'3 4'"
    assert "$a" @is "1 2"
    assert "$b" @is "3 4"
  )

  {
  # 包含换行符也没问题
    eval "a=$'1 2'
          b=$'3 4'"
    assert "$a" @is "1 2"
    assert "$b" @is "3 4"
  }

  (
  # 数组也没问题
    eval "a=($'1 2'
    $'3\n4')"
    assert "${#a[@]}" @is 2
    assert "${a[0]}" @is "1 2"
    assert "${a[1]}" @is $'3\n4'
  )

  {
  # 关联数组也没问题
    eval "declare -A a=([a]=$'1\n2' [b]=$'2' )"
    assert "${#a[@]}" @is 2
    assert "${a[a]}" @is $'1\n2'
    assert "${a[b]}" @is $'2'
  }
  (
    # 用$'' ANSI C Quoting格式看来也是安全的
    eval "a=$'1 2' b=$'3 4 script inject not work'"
    assert "$a" @is "1 2"
    assert "$b" @is "3 4 script inject not work"
  )
}

study.array(){
  a=("line1 a
line2" x)
    assert "$(printf "[%s]" "${a[*]}")" @is $'[line1][a][line2][x]'
    assert "$(printf "[%s]" ${a[*]})" @is $'[line1][a][line2][x]'
    # 由于"$@" 特殊语法，数组可已包含空格换行符， 不影响分词
    assert "$(printf "[%s]" "${a[@]}")" @is $'[line1 a\nline2][x]'
}

#######################################################
## bake test case
#######################################################

tests.assert_sample(){
  assert $((1+1)) @is 2
}

tests.path_dirname(){
  assert "$(bake.__path_dirname a/b/c '/')" @is "a/b"
  assert "$(bake.__path_dirname a     '/')" @is ""
  assert "$(bake.__path_dirname ""    '/')" @is ""

  # abstract path
  assert "$(bake.__path_dirname /a/b/c '/')" @is "/a/b"
  assert "$(bake.__path_dirname /a     '/')" @is ""
  assert "$(bake.__path_dirname /      '/')" @is ""
}
tests.path_first(){
  assert "$(bake.__path_first a/b/c  '/')" @is "a"
  assert "$(bake.__path_first a      '/')" @is "a"
  assert "$(bake.__path_first ''     '/')" @is ""

  assert "$(bake.__path_first /a/b/c '/')" @is "/a"
}

tests.path_basename(){
  assert "$(bake.__path_basename a/b/c '/')" @is "c"
  assert "$(bake.__path_basename a     '/')" @is "a"
  assert "$(bake.__path_basename ""    '/')" @is ""

  # abstract path
  assert "$(bake.__path_basename "/a"  '/')" @is "a"
  assert "$(bake.__path_basename "/"  '/')"  @is ""
}

tests.str_cutLeft(){
  assert "$(bake.__str_cutLeft a/b/c 'a/b/')" @is "c"
  assert "$(bake.__str_cutLeft a/b/c '')" @is "a/b/c"

  assert "$(bake.__str_cutLeft /a/b/c '/')" @is "a/b/c"

  assert "$(bake.__str_cutLeft a/b/c 'notStart')" @is "a/b/c"
  assert "$(bake.__str_cutLeft a/b/c '/')"        @is "a/b/c"
}


tests.cmd_up_chain(){
  assert "$(bake.__cmd_up_chain a.b)" @is "a.b
a
root"
  assert "$(bake.__cmd_up_chain 'root')" @is "root"
  assert "$(bake.__cmd_up_chain '')" @is "root"
}

tests.cmd_children(){
  assert "$(bake.__cmd_children test)" @is ""
  assert "$(bake.__cmd_children tests)" @contains "cmd_children"
}

tests.str_split(){
  assert "$(bake.__str_split "a/b" '/')"  @is "a
b"
  assert "$(bake.__str_split "a/b/" '/')" @is "a
b"

  # abstract path
  assert "$(bake.__str_split "/a/b" '/')"  @is "
a
b"
  assert "$(bake.__str_split "/a/b/" '/')" @is "
a
b"



  # 包含破坏性特殊字符
  #  $'string' 形式的字符序列被视为一种特殊类型的单引号。序列扩展为字符串，字符串中的反斜杠转义字符按照 ANSI C 标准指定进行替换。
  # https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting
  assert "$(bake.__str_split $'a\nb/c'  "/" )"  @is "a
b
c"
  assert "$(bake.__str_split $'a\n/b' "/" )"  @is "a

b"

  # default delimiter
  assert "$(bake.__str_split "a/b"  )"  @is "a
b"

  # other delimiter
  assert "$(bake.__str_split "a.b" '.')"  @is "a
b"
}

tests.cmd_register(){
  bake.__cmd_register
  assert "$(bake.info | grep tests.cmd_register)" \
    @contains "tests.cmd_register"
}

tests.opt_cmd_chain_opts(){
  assert "$(bake.__opts "root")" @is \
"root/opts/debug
root/opts/help
root/opts/interactive"

  # "include parent option"
  assert "$(bake.__opts "bake.opt")" @is \
"bake.opt/opts/cmd
bake.opt/opts/default
bake.opt/opts/desc
bake.opt/opts/long
bake.opt/opts/required
bake.opt/opts/short
bake.opt/opts/type
root/opts/debug
root/opts/help
root/opts/interactive"
}


# TODO bake.__cmd_children 命令可以改造为既可以输出全称也可以输出短名，还可以设置depth展示层级
# 查找出所有"tests."开头的函数并执行
# 这种测试有点麻烦，不如bake.test
function test(){
      while IFS=$'\n' read -r functionName ; do
        [[ "$functionName" != tests.* ]] && continue ;
        # run test
        printf "test: %s %-50s" "${TEST_PATH}" "$functionName()"
        # TIMEFORMAT: https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
        # %R==real %U==user %S==sys %P==(user+sys)/real
        TIMEFORMAT="real %R user %U sys %S percent %P"
        (
          # 隔离test在子shell里，防止环境互相影响
          time "$functionName" ;
        )# 2>&1
  #    done <<< "$(compgen -A function)" # 还是declare -F 再过滤保险
      done <<<"$(declare -F | grep "declare -f" | awk {'print $3'})"
}

#############################################################
# tail 初始化区
# 在头head定义变量，尾tail执行初始化，中间只有函数
#############################################################


bake.cmd --cmd root --desc "
$(cat <<END_DESC

Examples:
./$TEST_FILE test -h       # test list
./$TEST_FILE all           # or run all test in this file"


END_DESC
)
"

temp() {
  eval 'shift 2'
  echo "__help: $*"
}

# bake.opt --short 换成--short
bake.opt --cmd "root" --short i --long interactive  --type bool --desc "test.bash: 交互模式运行，会用到STDIN等，test.bash默认不交互"
eval "$(bake.parse "$@")"

bake.go "$@"
