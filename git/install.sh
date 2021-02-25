#!/usr/bin/env bash

read -p 'Configure Git user? ' -r
if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
  echo 'Username: '
  read -r username
  git config --global github.user "${username}"

  echo 'Name: '
  read -r name
  git config --global user.name "${name}"

  echo 'Email: '
  read -r email
  git config --global user.email "${email}"
fi

git config --global pull.rebase false
git config --global help.autocorrect 1
git config --global core.autocrlf 'input'
git config --global core.pager 'less -+X -+F'
