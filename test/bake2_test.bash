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
  assert "$(doctor | grep test.bake.cmd.register)" \
    @contains "test.bake.cmd.register=test.bake.cmd.register"
)
test.data.children(){
  assert "$(bake.data.children "bake.opt.add/opts")" @is_escape "abbr\ncmd\nname\noptHelp\nrequired\ntype"
}

test.opt.match(){
  assert "$(bake.opt.match "bake.opt.add" "--type")"    @is "bake.opt.add/opts/type"
  assert "$(bake.opt.match "bake.opt.add" "--optHelp")" @is "bake.opt.add/opts/optHelp"

  # root
  assert "$(bake.opt.match "bake.opt.add" "--help")"    @is "_root/opts/help" "_root command option"
}
test.opt.list(){
  assert "$(bake.opt.list "_root")" @is \
"_root/opts/help
_root/opts/verbose"

  # "include parent option"
  assert "$(bake.opt.list "bake.opt.add")" @is \
"bake.opt.add/opts/abbr
bake.opt.add/opts/cmd
bake.opt.add/opts/name
bake.opt.add/opts/optHelp
bake.opt.add/opts/required
bake.opt.add/opts/type
_root/opts/help
_root/opts/verbose"
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
#test.cmd.parse