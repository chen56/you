#!/usr/bin/env bash
set -o errtrace # trap inherited in sub script
set -o errexit
set -o functrace # If set, any trap on DEBUG and RETURN are inherited by shell functions

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

source "$TEST_DIR/../bake2" --lib_mode

bake.assert.fail() {
  echo "$@" >&2
}

function bake.test(){
  local testName="$1"
  echo "run test - $testName"
}
# 查找出所有test_函数并执行
# 这种测试有点麻烦，不如bake.test
function bake.test.runTest() {
    while IFS=$'\n' read -r functionName ; do
      [[ "$functionName" != test* ]] && continue ;
      echo "run test - ${TEST_PATH} - $functionName()"
      # run test
      "$functionName" # || echo "error : test[$functionName()] must return 0 , but:$?" && _stack_frame
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
     return 2
  fi
}

@is(){
  local actual="$1" expected="$2" msg="$3"
  if [[ "$actual" != "$expected" ]] ; then
    bake.assert.fail "assert is fail: $msg
     actual  : $actual
     expected: $expected"
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

test.assert_sample(){
  assert $((1+1)) @is 2
}
test.bash_string_escape(){
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

test.path_traverse_up(){
  assert "$(bake.path_traverse_up a.b '.')" @is_escape "a.b\na"
  assert "$(bake.path_traverse_up ''  '.')" @is ""
}
test.bake.split(){
  IFS='.' assert "$(bake.split "a.b" '.')"  @is_escape "a\nb"
  assert "$(bake.split "a.b." '.')" @is_escape "a\nb"

  # 包含破坏性特殊字符
  assert "$(bake.split $'a\nxb' "x" )"  @is_escape "a\\n\nb"
  assert "$(bake.split $'a\n.b' "." )"  @is_escape "a\n\nb" "default delimiter is raw newline "

  # defalut delimiter
  assert "$(bake.split "a.b"  )"  @is_escape "a\nb" "default delimiter is . "

  # other delimiter
  assert "$(bake.split "a/b" '/')"  @is_escape "a\nb"
  assert "$(bake.split "a
b
" "\n" )"  @is_escape "a\nb" "default delimiter is raw newline "
}

test.bake.cmd.register()(
  bake.cmd.register
  assert "$(doctor | grep test.bake.cmd.register)" \
    @contains "test.bake.cmd.register=test.bake.cmd.register"
)
test.data.children(){
  assert "$(bake.data.children "bake.opt.add/opts")" @is_escape "abbr\ncmd\nhelp\nname\ntype"
}

test.opt.match(){
  assert "$(bake.opt.match "bake.opt.add" "--type")" @is "type"
}

test.cmd.parse(){
  assert "$(bake.opt.parse "bake.opt.add" --type bool)" @is_escape "local type=bool;\nlocal optCount=1;"

  # no exists cmd
  assert "$(bake.opt.parse "no.exists.func" --type bool)" @is "local optCount=0;"

  # no exists option
  assert "$(bake.opt.parse "bake.opt.add" --no_exists_opt)" @is "local optCount=0;"
}

test.opt.add(){
  bake.opt.add --cmd "test.opt.add" --name boolopt --type bool

  assert "$(bake.opt.parse "test.opt.add" --boolopt)" @is_escape "local boolopt=true;\nlocal optCount=1;"

}
bake.test.runTest
