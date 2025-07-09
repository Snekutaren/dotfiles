#!/bin/bash

if ! grep -q 'exec fish' ~/.bashrc; then
  cat << 'EOF' >> ~/.bashrc
# Auto-switch to fish shell if not already in fish
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
then
  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
  exec fish $LOGIN_OPTION
fi
EOF
  echo "Added fish auto-switch snippet to ~/.bashrc"
else
  echo "fish auto-switch snippet already present in ~/.bashrc"
fi
