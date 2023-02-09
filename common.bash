#!/usr/bin/env bash
set -o errtrace #trap inherited in sub script
set -o errexit
set -o functrace #trap inherited in function
# set -x
common_a() {
   return
}
common_b () {
   return
}
echo " common"
IFS=$'\n'
for f in $(declare -F); do
   echo "    ${f:11}"
done
echo " common"
