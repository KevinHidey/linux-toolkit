#!/bin/bash
set -euo pipefail

# git-menu.sh
# Git terminal menu for the linux-toolkit project.
#
# What it does:
# - Shows a simple Git menu
# - Helps with status, add, commit, push, pull, and remote setup
# - Uses the linux-toolkit GitHub repo as the default remote
#
# Use it inside the linux-toolkit project folder.

DEFAULT_REMOTE="https://github.com/KevinHidey/linux-toolkit.git"

# Check if this folder looks like the linux-toolkit project.
# This helps prevent running git add . in the wrong folder.
if [ ! -d "scripts" ] || [ ! -f "README.md" ]; then
  echo "Error: This does not look like the linux-toolkit project folder."
  echo "Make sure you are inside the folder that contains:"
  echo "- scripts/"
  echo "- README.md"
  echo
  echo "Example:"
  echo "cd ~/linux-toolkit"
  exit 1
fi

# Check if Git is initialized.
if [ ! -d ".git" ]; then
  echo "Git is not initialized in this folder."
  read -p "Initialize Git here? (y/n): " init_choice

  if [ "$init_choice" = "y" ] || [ "$init_choice" = "Y" ]; then
    git init
    git branch -M main
    echo "Git initialized."
  else
    echo "Cancelled."
    exit 1
  fi
fi

while true; do
  echo
  echo "================================"
  echo "     linux-toolkit Git Menu"
  echo "================================"
  echo "1. Show git status"
  echo "2. Add all files"
  echo "3. Commit changes"
  echo "4. Push to GitHub"
  echo "5. Pull latest changes"
  echo "6. Add + Commit + Push"
  echo "7. Set GitHub remote"
  echo "8. Show recent commits"
  echo "9. Show tracked files"
  echo "10. Exit"
  echo "================================"

  read -p "What do you want to do? " choice

  case "$choice" in
    1)
      # Shows changed, deleted, and untracked files.
      git status
      ;;

    2)
      # Adds all files in the current project folder.
      # Make sure .gitignore ignores logs and backups.
      git add .
      echo "Files added."
      ;;

    3)
      # Creates a commit with your message.
      read -p "Commit message: " message

      if [ -z "$message" ]; then
        echo "Commit message cannot be empty."
      else
        git commit -m "$message"
      fi
      ;;

    4)
      # Uploads committed changes to GitHub.
      # -u sets the upstream branch the first time.
      git push -u origin main
      ;;

    5)
      # Downloads latest changes from GitHub.
      git pull origin main
      ;;

    6)
      # Adds all files, commits them, then pushes to GitHub.
      read -p "Commit message: " message

      if [ -z "$message" ]; then
        echo "Commit message cannot be empty."
      else
        git add .
        git commit -m "$message"
        git push -u origin main
      fi
      ;;

    7)
      # Adds or updates the GitHub remote URL.
      # Press Enter to use the default linux-toolkit remote.
      read -p "GitHub repo URL [$DEFAULT_REMOTE]: " repo_url
      repo_url="${repo_url:-$DEFAULT_REMOTE}"

      if git remote | grep -q "^origin$"; then
        git remote set-url origin "$repo_url"
        echo "Remote origin updated."
      else
        git remote add origin "$repo_url"
        echo "Remote origin added."
      fi

      git remote -v
      ;;

    8)
      # Shows the last 10 commits.
      git log --oneline --graph --decorate -10
      ;;

    9)
      # Shows exactly which files Git is tracking.
      # Useful to check that no private files are included.
      git ls-files
      ;;

    10)
      # Exits the menu.
      echo "Goodbye."
      exit 0
      ;;

    *)
      # Handles invalid input.
      echo "Invalid choice. Choose 1 to 10."
      ;;
  esac
done
