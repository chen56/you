#!/usr/bin/env bash
set -o errtrace # -E trap inherited in sub script
set -o errexit # -e
set -o functrace # -T If set, any trap on DEBUG and RETURN are inherited by shell functions
set -o pipefail  # default pipeline status==last command status, If set, status=any command fail
#set -o nounset # -u: don't use it ,it is crazy, 1.bash version is diff Behavior 2.we need like this: ${arr[@]+"${arr[@]}"}

function _readlink() (
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

TEST_PATH="$(_readlink "${BASH_SOURCE[0]}")"
TEST_DIR="$(dirname "$TEST_PATH")"
TEST_FILE="$(basename "$TEST_PATH")"

source "$TEST_DIR/../bake2" --lib_mode

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
     actual  : $escaped
     expected: $expected"
     echo "diff------------------------->" >&2
     diff <(echo -e "$actual") <(echo -e "$expected") >&2
     return 2
  fi
}

@is(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != "$expected" ]] ; then
    bake.assert.fail "assert is fail: $msg
     actual  : $actual
     expected: $expected"
     echo "diff------------------------->" >&2
     diff <(echo -e "$actual") <(echo -e "$expected") >&2
     return 2
  fi
}
@contains(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != *"$expected"* ]] ; then
    bake.assert.fail "assert contains fail: $msg
     actual  : $actual
     expected: $expected"
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
study.bash.string_escape(){
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
study.bash.read(){
  local expected="";
  echo -e "1\n2" | while read -r x ; do
    expected+="$1,"
  done
  assert "$expected" @is '1,2,'
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


test.bake.cmd.list_up(){
  assert "$(bake.cmd.list_up a.b)" @is_escape "a.b\na\n_root"
  assert "$(bake.cmd.list_up '_root')" @is "_root"
  assert "$(bake.cmd.list_up '')" @is "_root"
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
  assert "$(bake.data.children "bake.opt.set/opts")" @is_escape "abbr\ncmd\nname\noptHelp\nrequired\ntype"
}

test.bake.opt.cmd_opts(){
  assert "$(bake.opt.cmd_opts "_root")" @is \
"_root/opts/help
_root/opts/verbose"

  # "include parent option"
  assert "$(bake.opt.cmd_opts "bake.opt.set")" @is \
"_root/opts/help
_root/opts/verbose
bake.opt.set/opts/abbr
bake.opt.set/opts/cmd
bake.opt.set/opts/name
bake.opt.set/opts/optHelp
bake.opt.set/opts/required
bake.opt.set/opts/type"
}

test.cmd.parse(){

  assert "$(bake.opt.parse "bake.opt.set" --type bool)" @is_escape "local type=bool;\nlocal optCount=1;"

  # no exists cmd
  assert "$(bake.opt.parse "no.exists.func" --type bool)" @is "local optCount=0;"

  # no exists option
  assert "$(bake.opt.parse "bake.opt.set" --no_exists_opt)" @is "local optCount=0;"
}

test.bake.opt.set(){
  bake.opt.set --cmd "test.opt.add" --name boolopt --type bool
}
test.bake.opt.value.parse_and_get_value(){
  bake.opt.set --cmd "test.opt.add" --name xxx --type string
  bake.opt.parse "test.opt.add" --xxx chen >/dev/null
  assert "$(bake.opt.value "test.opt.add" "xxx")" @is "chen"
}

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