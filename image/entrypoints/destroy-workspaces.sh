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

cd "$INPUT_PATH"
for workspace in $(terraform workspace list|sed 's/*//g');
  do
    if [[ $workspace = PR* ]]
    then
      echo $workspace
    fi
  done
