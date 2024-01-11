#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
# :set number tabstop=2 shiftwidth=2 fileformat=unix expandtab
#
# DESCRIPTION:
# 
# NOTE:
# 

# Set shell behavior
set -k


#######################################
# Performs dependency check to ensure
#   that the command is in the system
#   PATH variable.
# Arguments:
#   Command to be checked
#######################################
dependency_check(){
  cmd=${1}

  # Check dependency
  if ! hash ${cmd} 2>/dev/null; then
    # exit_error "Dependenncy: ${cmd} is not installed or added to the system path. Please check. Exiting..."
    # exit 1
    echo "${1} not found..."
  fi
}


# Checks
if ! hash python 2>/dev/null; then
  python=$(which python3)
else
  python=$(which python)
fi

if ! hash pip 2>/dev/null; then
  pip=$(which pip3)
else
  pip=$(which pip)
fi


# setup

# xcode
xcode-select --install

# set path
export PATH="${PATH}:/Users/adebayobraimah/Library/Python/3.9/bin:/opt/homebrew/bin"

${pip} install --upgrade pip

${pip} install ansible


# ansible-inventory -i inventory --list

# ansible all -m ping -i inventory

# ansible-playbook -i inventory main.yaml

ansible-galaxy install -r requirements.yaml

ansible-playbook main.yaml --ask-become-pass

