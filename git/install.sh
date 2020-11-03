#!/usr/bin/env bash

# Configure Git
read -p "Configure Git? " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Configuring Git..."

  echo "Username: "
  read -r username
  git config --global github.user "$username"

  echo "Name: "
  read -r name
  git config --global user.name "$name"

  echo "Email: "
  read -r email
  git config --global user.email "$email"

  git config --global pull.rebase false
  git config --global core.autocrlf "input"
  git config --global help.autocorrect "1"
fi
