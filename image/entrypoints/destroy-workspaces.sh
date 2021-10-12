#!/bin/bash

# shellcheck source=../actions.sh
source /usr/local/actions.sh

debug
setup
init-backend
select-workspace
set-plan-args

# We can't delete an active workspace, so re-initialize with a 'default' workspace (which may not exist)
workspace=$INPUT_WORKSPACE
INPUT_WORKSPACE=default
init-backend

echo "test1"
cd "$INPUT_PATH"
echo "test2"

echo $PLAN_ARGS
for workspace in $(terraform workspace list|sed 's/*//g');
  do
    if [[ $workspace = PR* ]]
    then
      echo $workspace
    fi
  done
