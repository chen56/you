#!/usr/bin/env bash
set -o errtrace # -E trap inherited in sub script
set -o errexit # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail
#set -o nounset # -u: don't use it ,it is crazy, 1.bash version is diff Behavior 2.we need like this: ${arr[@]+"${arr[@]}"}

function _real_path() (
  cd -P "$(dirname -- "$1")"
  file="$PWD/$(basename -- "$1")"
  while [[ -L "$file" ]]; do
    cd -P "$(dirname -- "$file")"
    file="$(readlink -- "$file")"
    cd -P "$(dirname -- "$file")"
    file="$PWD/$(basename -- "$file")"
  done
  echo "$file"
)

TEST_PATH="$(_real_path "${BASH_SOURCE[0]}")"
TEST_DIR="$(dirname "$TEST_PATH")"
TEST_FILE="$(basename "$TEST_PATH")"

source "$TEST_DIR/../bake"


bake.assert.fail() {
  echo "$@" >&2
}

# 查找出所有test_函数并执行
# 这种测试有点麻烦，不如bake.test
function bake.test.all() {
    while IFS=$'\n' read -r functionName ; do
      [[ "$functionName" != test.* ]] && continue ;
      # run test
      printf "test: %s %-50s" "${TEST_PATH}" "$functionName()"
      # TIMEFORMAT: https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
      # %R==real %U==user %S==sys %P==(user+sys)/real
      TIMEFORMAT="real %R user %U sys %S percent %P"
      time "$functionName" #2>&1
    done <<< "$(compgen -A function)"
}

@is_escape(){
  local actual="$1" expected="$2" msg="$3"
  local escaped; escaped="$(printf '%q' "${actual}")"
  escaped="${escaped#$\'}" # "$'str'" remove begin "$'" => "str'"
  escaped="${escaped%\'*}" # "str'" remove end "'"  => "str"
  if [[ "$escaped" != "$expected" ]] ; then
    bake.assert.fail "assert is_escape fail: $msg
     actual       : [$escaped]
     is not escape: [$expected]"
     echo "diff------------------------->" >&2
     diff <(echo -e "$expected") <(echo -e "$actual") >&2
     return 2
  fi
}

@is(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != "$expected" ]] ; then
    bake.assert.fail "assert is fail: $msg
     actual         : [$actual]
     is not         : [$expected]
     --------------------------------------------------
     actual escape  : [$(printf '%q' "$actual")]
     is not escape  : [$(printf '%q' "$expected")]
     "
     echo "diff------------------------->" >&2
     diff <(echo -e "$expected") <(echo -e "$actual") >&2
     return 2
  fi
}
@contains(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != *"$expected"* ]] ; then
    bake.assert.fail "assert fail: $msg
     actual         : [$actual]
     is not contains: [$expected]"
     return 2
  fi
}


# Usage: assert <actual> <assert_op_func> <expected> [msg]
# Sample: assert $(( 1+1 )) @is "2"
assert(){
  local actual="$1" op="$2" expected="$3" msg="$4"
  "$2" "$actual" "$3" "$4"
}

# above is test framework
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# below is test case

#######################################################
## study bash or some other
#######################################################
# IFS : https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_05
study.string.escape(){
  # $'' 语法
  assert $'1\n2' @is '1
2'
  assert '1\n2' @is '1\n2'

  assert $'1
2' @is $'1\n2'

  x="1
2"
  assert "$(printf '%q' "$x" )" @is "$'1\n2'"
}
study.read(){
  local expected="";
  echo -e "1\n2" | while read -r x ; do
    expected+="$1,"
  done
  assert "$expected" @is '1,2,'
}
study.function.return(){
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
    printf "${str}" | od -c -td1
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


function test.bake.str.escape() {
    assert "$(bake.str.escape $'1')"     @is "'1'"
    assert "$(bake.str.escape $'1 ')"    @is "'1 '"
    assert "$(bake.str.escape $'1 2 "')" @is "'1 2 \"'"
    assert "$(bake.str.escape $'1 "')"   @is "'1 \"'"
    assert "$(bake.str.escape $'1 2\n')" @is "\$'1 2\n'"
}
function test.bake.str.unescape() {
    assert "$(bake.str.unescape "$(bake.str.escape $'1'    )")"      @is $'1'
    assert "$(bake.str.unescape "$(bake.str.escape $'1 2'  )")"      @is $'1 2'
    assert "$(bake.str.unescape "$(bake.str.escape $'1 " ' )")"      @is $'1 " '
    assert "$(bake.str.unescape "$(bake.str.escape $'1 \n ' )")"     @is $'1 \n '
}
test.study.declare(){
  (
    declare a=1 b=2
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
    s='a=1 b=2'
    declare $(printf "%s" "$s")
    assert "$a" @is "1"
    assert "$b" @is "2"
  )

    # declare ansi c quoting $''
  (
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
# eval 用起来比declare 省心多了
test.study.eval(){
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
    assert "$(printf "[%s]" ${a[@]})" @is $'[line1][a][line2][x]'
    assert "$(printf "[%s]" ${a[@]})" @is $'[line1][a][line2][x]'
    # 由于"$@" 特殊语法，数组可已包含空格换行符， 不影响分词
    assert "$(printf "[%s]" "${a[@]}")" @is $'[line1 a\nline2][x]'

}

#######################################################
## bake test case
#######################################################

test.assert_sample(){
  assert $((1+1)) @is 2
}

test.bake.path.dirname(){
  assert "$(bake.path.dirname a/b/c '/')" @is "a/b"
  assert "$(bake.path.dirname a     '/')" @is ""
  assert "$(bake.path.dirname ""    '/')" @is ""

  # abstract path
  assert "$(bake.path.dirname /a/b/c '/')" @is "/a/b"
  assert "$(bake.path.dirname /a     '/')" @is ""
  assert "$(bake.path.dirname /      '/')" @is ""
}
test.bake.path.first(){
  assert "$(bake.path.first a/b/c  '/')" @is "a"
  assert "$(bake.path.first a      '/')" @is "a"
  assert "$(bake.path.first ''     '/')" @is ""

  assert "$(bake.path.first /a/b/c '/')" @is "/a"
}

test.bake.path.basename(){
  assert "$(bake.path.basename a/b/c '/')" @is "c"
  assert "$(bake.path.basename a     '/')" @is "a"
  assert "$(bake.path.basename ""    '/')" @is ""

  # abstract path
  assert "$(bake.path.basename "/a"  '/')" @is "a"
  assert "$(bake.path.basename "/"  '/')"  @is ""
}

test.bake.str.cutLeft(){
  assert "$(bake.str.cutLeft a/b/c 'a/b/')" @is "c"
  assert "$(bake.str.cutLeft a/b/c '')" @is "a/b/c"

  assert "$(bake.str.cutLeft /a/b/c '/')" @is "a/b/c"

  assert "$(bake.str.cutLeft a/b/c 'notStart')" @is "a/b/c"
  assert "$(bake.str.cutLeft a/b/c '/')"        @is "a/b/c"
}


test.bake.cmd.up_chain(){
  assert "$(bake.cmd.up_chain a.b)" @is_escape "a.b\na\n_root"
  assert "$(bake.cmd.up_chain '_root')" @is "_root"
  assert "$(bake.cmd.up_chain '')" @is "_root"
}
test.bake.cmd.children(){
  assert "$(bake.cmd.children bake.test)" @is_escape "all"
}

test.bake.str.split(){
  assert "$(bake.str.split "a/b" '/')"  @is_escape "a\nb"
  assert "$(bake.str.split "a/b/" '/')" @is_escape "a\nb"

  # abstract path
  assert "$(bake.str.split "/a/b" '/')"  @is_escape "\na\nb"
  assert "$(bake.str.split "/a/b/" '/')" @is_escape "\na\nb"


  # 包含破坏性特殊字符
  assert "$(bake.str.split $'a\nb'  "/" )"  @is_escape "a\nb"
  assert "$(bake.str.split $'a\n/b' "/" )"  @is_escape "a\n\nb"
  assert "$(bake.str.split "a
/b
" )"  @is_escape "a\n\nb"

  # default delimiter
  assert "$(bake.str.split "a/b"  )"  @is_escape "a\nb"

  # other delimiter
  assert "$(bake.str.split "a.b" '.')"  @is_escape "a\nb"
}

test.bake.cmd.register()(
  bake.cmd.register
  assert "$(_self | grep test.bake.cmd.register)" \
    @contains "test.bake.cmd.register"
)
test.data.children(){
  assert "$(bake.data.children "bake.opt.set/opts")" @is_escape "abbr\ncmd\ndefault\nname\noptHelp\nrequired\ntype"
}

test.bake.opt.cmd_chain_opts(){
  assert "$(bake.opt.cmd_chain_opts "_root")" @is \
"_root/opts/help
_root/opts/log
_root/opts/verbose"

  # "include parent option"
  assert "$(bake.opt.cmd_chain_opts "bake.opt.set")" @is \
"_root/opts/help
_root/opts/log
_root/opts/verbose
bake.opt.set/opts/abbr
bake.opt.set/opts/cmd
bake.opt.set/opts/default
bake.opt.set/opts/name
bake.opt.set/opts/optHelp
bake.opt.set/opts/required
bake.opt.set/opts/type"
}

test.cmd.parse(){
  bake.opt.set --cmd "test.cmd.parse" --name stringOpt --type string
  bake.opt.set --cmd "test.cmd.parse" --name boolOpt --type bool
  bake.opt.set --cmd "test.cmd.parse" --name listOpt --type list

  assert "$(bake.opt.parse "test.cmd.parse" --boolOpt )" @is 'declare boolOpt="true";
declare optShift=1;'
  assert "$(bake.opt.parse "test.cmd.parse" --stringOpt "1 2" )" @is 'declare stringOpt="1 2";
declare optShift=2;'

  # list type option
  assert "$(bake.opt.parse "test.cmd.parse" --listOpt "a 1" --listOpt "b 2" )" @is 'declare listOpt=([0]="a 1" [1]="b 2");
declare optShift=4;'

  # no exists cmd
  assert "$(bake.opt.parse "no.exists.func" --unknow_opt bool)" @is "declare optShift=0;"

  # no exists option
  assert "$(bake.opt.parse "test.cmd.parse" --no_exists_opt)" @is "declare optShift=0;"
}

test.bake.opt.set()(
  bake.opt.set --cmd "test.opt.add" --name boolopt --type bool
)

test.bake.opt.value.parse_and_get_value()(
  bake.opt.set --cmd "test.opt.add" --name xxx --type string
  echo $(bake.opt.parse "test.opt.add" --xxx chen)
  eval "$(bake.opt.parse "test.opt.add" --xxx chen)"
  assert "$xxx" @is "chen"
)


function test(){
  bake.test.all
}

# override test
_root(){
  echo "you can run
   ./test/$TEST_FILE test -h       # test subcommands
   ./test/$TEST_FILE test          # or run all test in this file"
}


bake.go "$@"
