#!/usr/bin/env bash
echo "Setting up Git.."

# Check if Git is installed. If not, install it
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
  echo "Installing Git.."
  brew install git
fi

# Configure Git
read -p "Configure Git? " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Configuring Git..."

  echo "Username: "
  read username
  git config --global github.user $username

  echo "Name: "
  read name
  git config --global user.name $name

  echo "Email: "
  read email
  git config --global user.email $email

  git config --global core.editor "vim"
  git config --global core.autocrlf "input"
  git config --global help.autocorrect "1"
fi

# Install command line auto completion
brew install bash-completion
