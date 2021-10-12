#!/bin/bash

# shellcheck source=../actions.sh
source /usr/local/actions.sh
echo "test1"
debug
echo "test2"
setup
echo "test3"
init-backend
echo "test4"
select-workspace
echo "test5"
set-plan-args
echo "test6"
# We can't delete an active workspace, so re-initialize with a 'default' workspace (which may not exist)
workspace=$INPUT_WORKSPACE
INPUT_WORKSPACE=default
init-backend

echo "test7"
cd "$INPUT_PATH"
echo "test8"

echo $PLAN_ARGS
for workspace in $(terraform workspace list|sed 's/*//g');
  do
    if [[ $workspace = PR* ]]
    then
      echo $workspace
    fi
  done
