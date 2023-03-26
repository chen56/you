#!/usr/bin/env bash
set -o errtrace #trap inherited in sub script
set -o errexit
set -o functrace #trap inherited in function
# set -x

# bake == (bash)ake == 去make的bash工具
# v0.1.20230222
# ------------------------------------------------------------------------------
# bake 是个简单的自建命令工具，以替代Makefile的子命令功能
# make工具的主要特点是处理文件依赖进行增量编译，但flutter、golang、java、js项目的build工具
# 太厉害了，这几年唯一还在用Makefile的理由就是他的子命令机制: "make build"、
# "make run", 可以方便的自定义单一入口的父子命令，但Makefile本身的语法套路也很复杂，
# 很多批处理还是要靠bash, 这就尴尬了，工具太多，麻烦！本脚本尝试彻底摆脱使用Makefile。
# 经尝试，代码很少啊 ，公共代码几十行啊，还主要是提取显示子命令帮助的，功能足够了：
#   ./bake       # 列子命令看帮助，
#   ./bake build # 子命令
#   ./bake run   # 子命令
# bake命令规则：
# 1. 定义以斜杠"/"为前缀的function作为子命令，/build、/run、/assets/list、
#    表示命令的其父子关系，执行时去掉斜杠/, 构成父子命令：./bake assets list -x -y -z
# 2. 命令的帮助从命令后跟?shortHelp的函数提取，比如/build?shortHelp
# 3. 除bash外，尽量不依赖其他工具，包括linux coreutils,以便跨平台更简单
# 搞docker那样的命令树，应该也不难，目前和make一样只支持一级子命令，暂时够用。
# ------------------------------------------------------------------------------

#if ((BASH_VERSINFO[0] < 4)); then
#  echo "Error: 您bash版本过低(BASH_VERSINFO: ${BASH_VERSINFO[*]})，请安装bash 4+ 后重启terminal:
#  apt install bash  # ubuntu
#  brew install bash # mac"
#  exit 1
#fi

# copy from flutter
# ----------------------
# On Mac OS, readlink -f doesn't work, so follow_links traverses the path one
# link at a time, and then cds into the link destination and find out where it
# ends up.
#
# The returned filesystem path must be a format usable by Dart's URI parser,
# since the Dart command line tool treats its argument as a file URI, not a
# filename. For instance, multiple consecutive slashes should be reduced to a
# single slash, since double-slashes indicate a URI "authority", and these are
# supposed to be filenames. There is an edge case where this will return
# multiple slashes: when the input resolves to the root directory. However, if
# that were the case, we wouldn't be running this shell, so we don't do anything
# about it.
#
# The function is enclosed in a subshell to avoid changing the working directory
# of the caller.
function follow_links() (
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
declare BAKE_HOME
BAKE_HOME=$(dirname "$(follow_links "${BASH_SOURCE[0]}")")

/test1?() {
  /test1?shortHelp() {
    cat <<EOF
测试shortHelp的规范 ，shortHelp line 1
shortHelp line 2
shortHelp line 3
EOF
  }
  /test1() {
    run echo "test1 run $*"
  }
}

/test_option?() {
  /test_option?shortHelp() {
    cat <<EOF
测试参数规范
  ./bake test2 -h
  ./bake test2 -n chen56
  ./bake test2 --name chen56
EOF
  }
  /test_option?option() {
    option "-n" "--name" "名称" "参数帮助:名称"
    option "-v" "--version" "" "参数帮助:版本"
  }

  /test_option?option() {
#    echo "${name}"
#    echo "${version}"
     echo "???"
  }

}

option() {
  local short="$1"
  local long="$2"

  local arg="$3"
  local help="$4"
  local hasArg=false
  [[ $arg != "" ]] && hasArg=true
  echo "hasArg: $hasArg"
  local toString="short:'$short', long:'$long',arg:'$arg', help:'$help'"
  if [[ $long == "" ]]; then
    cat <<<"long option must not be empty: ($toString)
        # option 'short option' 'long option(no empty!)'   'arg info'   'help'
        # option '-n'           '--name'                   'your name'  'give me your name'
     "
    exit 1
  fi

}

#/test_option?option
#echo 临时退出 && exit 1

# 项目init
/init?() {
  /init?shortHelp() { cat <<<"初始化项目工具"; }
  /init() {
    run git lfs install
    (
      cd "note_app"
      # 增加平台支持到现存项目
      # https://docs.flutter.dev/development/platform-integration/desktop#add-desktop-support-to-an-existing-flutter-app
      run flutter create --platforms=macos .
    )
  }
}

# 项目init
/get?() {
  /get?shortHelp() { cat <<<"all: pub get"; }
  /get() {
     /exec flutter pub get
  }
}

# patterns 无法使用，error：flutter build web
#  // flutter build error - Flutter 3.9.0-1.0.pre.2 • channel beta
#  // Target dart2js failed: Exception: Warning: The 'dart2js' entrypoint script is deprecated, please use 'dart compile js' instead.
#  // ../note/lib/mate_old.dart:39:10:
#  // Error: Expected an identifier, but got 'switch'.
#  // return switch (init) {
#  //   /// Mate 不直接 return [Mate.mateParams] 而复制一份ObjectParam的原因是 C可能是可空类型，而Mate.mateParams不是
#  //   List() => throw Exception("List type please use putList()"),
#  //   Mate<C>() => ObjectParam.copy(init.mateParams),
#  //   Param() => init as Param<C>,
#  //   _ => Param.newValue(init: init),
#  // };
enable_experiment="--enable-experiment=records,patterns"
/build?() {
  /build?shortHelp() { cat <<<"生产build"; }
  /build() {
    # web-renderer=canvaskit 太大了十几MB,所以要用html版
    # github只能发到项目目录下，所以加个base-href: https://chen56.github.com/note
#    ( cd note_app; run flutter build macos -v --enable-experiment=records --release ; )
    ( cd packages/note_app; run flutter build web -v $enable_experiment --release --web-renderer html --base-href "/note/" ; )
  }
}

/test?() {
  /test?shortHelp() { cat <<<"test"; }
  /test() {
     /exec flutter test
   }
}

/preview?() {
  /preview?shortHelp() { cat <<<"预览，先build,再开web server: http://localhost:8000"; }
  /preview() {
#   http-server 不支持base href设置，所以单独build,并设置base-href为"/",而github-pages的base-href必须是repository名
#    /build "$@"
    ( cd packages/note_app; run flutter build web -v $enable_experiment --release --web-renderer html --base-href "/" ; )
    # 	npx http-server ./app_note/build/web --port 8000
    run deno run --allow-env --allow-read --allow-sys --allow-net npm:http-server ./packages/note_app/build/web --port 8000
  }
}


/ci?() {
  /ci?shortHelp() { cat <<<"ci重建"; }
  /ci() {
    (
      flutter --version
      /clean
      /get
      /build
      /test
    )
  }
}

/gen?() {
  /gen?shortHelp() { cat <<<"代码生成"; }
  /gen() {
    (cd packages/note_app ;          run dart run tools/gen_pages.dart; )
    (cd packages/note_mate_flutter ; run dart run tools/gen_mates.dart; )
  }
}
/regen?() {
  /regen?shortHelp() { cat <<<"先删除old, 再代码生成"; }
  /regen() {
    run rm packages/note_app/lib/pages.g.dart
    run rm -rf packages/note_mate_flutter/lib
    (cd packages/note_app ;          run dart run tools/gen_pages.dart ; )
    (cd packages/note_mate_flutter ; run dart run tools/gen_mates.dart ; )
  }
}

/run?() {
  /run?shortHelp() { cat <<<"开发模式 flutter run: http://localhost:8000"; }
  /run() {
    (
      cd packages/note_app; run flutter run --web-renderer html --device-id chrome $enable_experiment "$@" ;
    )
  }
}

/exec?() {
  /exec?shortHelp() { cat <<<"exec [cmd] , 在各flutter项目目录依次执行exec后跟的参数cmd"; }
  /exec() {
#       目录中有"pubspec.yaml"的，认为是flutter项目
#        for project in $( find . -name pubspec.yaml | sed s/pubspec.yaml$//g ) ; do
#          # 用括号()开启子进程执行，可以不影响当前进程的环境
#          ( cd "$project" ;  run "$@" ; )
#        done
        (cd packages/note ;              run "$@" ; )
        (cd packages/note_mate_flutter ; run "$@" ; )
        (cd packages/note_app ;          run "$@" ; )
   }
}


# 清理
/clean?() {
  /clean?shortHelp() { cat <<<"清理项目目录"; }
  /clean() {
     /exec flutter clean
  }
}

_help() {
  cat <<-'__EOF'
____ _    _  _ ___ ___ ____ ____    _  _ ____ ___ ____
|___ |    |  |  |   |  |___ |__/ __ |\ | |  |  |  |___
|    |___ |__|  |   |  |___ |  \    | \| |__|  |  |___
Usage:
./bake [command] [options]

Available Commands:
__EOF

  print_commands

}

##########################################
# 以下是bake命令行玩法的公共代码，与业务无关
##########################################
on_error() {
  echo "traped an error: ↑ , trace: ↓" >&2
  print_stack
}

print_stack() {
  local i=0
  local errout
  while true; do
    errout=$(caller $i 2>&1 && true) && true
    if [[ $? != 0 ]]; then break; fi
    echo "  $errout" >&2

    i=$((i + 1))
  done
}
# 先打印 后执行
run() {
#  local project=${PWD#*$BAKE_HOME}
  local project
  project=$(basename "$PWD")
  [[ "$PWD" == "$BAKE_HOME" ]] && project="root"
  echo -e "【${project}】▶︎${FUNCNAME[1]} ▶︎ $*"
  eval "$@"
  return $?
}


exec_from_stdin() { while read cmd; do "$cmd"; done; }
initCommands(){
    exec_from_stdin <<< "$(declare -F | grep -E "^declare -f (\/.*)\?$" | sed -r 's/^declare -f //')"
}

print_commands() {
  IFS=$'\n'

  # 我们要找出形如'/build?'开头的函数，作为子命令的注册函数
  # 列出所有/开头的命令
  # declare -F 会列出所有定义,比如
  # $ declare -F
  #     => declare -f /build?
  #     => declare -f /run?
  #转成命令全名 fullNames
  #     => /build
  #     => /run
  # 而fullName 是最终可执行的自命令函数
  IFS=$'\n' # 分配回车符给IFS
  local fullNames
  fullNames=$(declare -F | grep -E "^declare -f (\/.*)\?$" | sed -r 's/^declare -f (\/.*)\?$/\1/')
  readarray -t fullNames <<<"$fullNames"
  local commands=()
  local shortHelps=()
  local maxLengthOfCmd=0
  local i=0
  for cmdFullname in ${fullNames[*]}; do
    # 先调用最外层注册命令
    "${cmdFullname}?"
    # 现在可以取到内层注册的函数，取帮助等
    local shortHelp
    shortHelp=$("${cmdFullname}?shortHelp" 2>/dev/null || true)
    shortHelps[i]=${shortHelp}

    # 先去第一个"/"，再按"/"split成数组
    # shellcheck disable=SC2207
    local split=($(tr "/" " " <<<"${cmdFullname:1}"))
    local cmd=${split[0]} #目前只用 第一个命令, 将来可以扩展为多层父子命令
    commands[i]=${cmd}
    # 求命令的最大长度，一会padding用
    if ((${#cmd} > maxLengthOfCmd)); then maxLengthOfCmd=${#cmd}; fi
    i=$((i + 1))
  done

  # print all commands and shortHelp
  for i in ${!commands[*]}; do
    local padding
    padding=$(printf %-$((maxLengthOfCmd + 6))b "")
    # 第二行开始，都补空格
    local shortHelp
    shortHelp=$(sed "2,1000s/^/$padding/g" <<<"${shortHelps[i]}")
    printf "  %-$((maxLengthOfCmd))s    ${shortHelp}\n" "${commands[i]}"
  done

  return
}


##########################################
# 以下是 main 脚本执行区
##########################################

trap " set +x; on_error " ERR

# 首先进入项目根目录，这样函数里就可以用相对路径，简化命令
cd "${BAKE_HOME}"

# init all sub commands
initCommands

# 执行./bake 没参数，即没子命令，就显示help
if [ "$#" == 0 ]; then
  _help # 根命令的帮助
  echo
  echo ">>> Error: missing command './bake COMMAND'"
  exit 1
fi

cmd="$1"
shift

# cmd 加上/前缀就是相应的函数
cmdFullName="/$cmd"
if ! declare -f "$cmdFullName" >/dev/null 2>&1; then
  echo "Error: 404 ,command '${cmd}' not exists, command function '${cmdFullName}()'" not found
  exit 1
fi

# 加上/前缀执行相应的function
# 比如"./bike build" ,执行的是"/build"函数
# shellcheck disable=SC2145
# 先跑外层注册命令
# 再执行命令
$cmdFullName "$@"