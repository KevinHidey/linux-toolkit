#!/bin/bash
set -euo pipefail

# git-menu.sh
# Simple Git terminal menu for Linux.
#
# What it does:
# - Shows a menu
# - Lets you run common Git commands quickly
# - Helps you add, commit, push, pull, and set a remote
#
# Use it inside the folder of your Git project.

while true; do
  echo
  echo "=============================="
  echo "        Git Terminal Menu"
  echo "=============================="
  echo "1. Show git status"
  echo "2. Add all files"
  echo "3. Commit changes"
  echo "4. Push to GitHub"
  echo "5. Pull latest changes"
  echo "6. Add + Commit + Push"
  echo "7. Set GitHub remote"
  echo "8. Show recent commits"
  echo "9. Exit"
  echo "=============================="

  read -p "What do you want to do? " choice

  case "$choice" in
    1)
      # Shows changed, deleted, and untracked files.
      git status
      ;;

    2)
      # Adds all files in the current project folder.
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
      git push
      ;;

    5)
      # Downloads latest changes from GitHub.
      git pull
      ;;

    6)
      # Adds all files, commits them, then pushes to GitHub.
      read -p "Commit message: " message

      if [ -z "$message" ]; then
        echo "Commit message cannot be empty."
      else
        git add .
        git commit -m "$message"
        git push
      fi
      ;;

    7)
      # Adds or updates the GitHub remote URL.
      read -p "GitHub repo URL: " repo_url

      if [ -z "$repo_url" ]; then
        echo "Repo URL cannot be empty."
      else
        if git remote | grep -q "^origin$"; then
          git remote set-url origin "$repo_url"
          echo "Remote origin updated."
        else
          git remote add origin "$repo_url"
          echo "Remote origin added."
        fi

        git remote -v
      fi
      ;;

    8)
      # Shows the last 10 commits.
      git log --oneline --graph --decorate -10
      ;;

    9)
      # Exits the menu.
      echo "Goodbye."
      exit 0
      ;;

    *)
      # Handles invalid input.
      echo "Invalid choice. Choose 1 to 9."
      ;;
  esac
done
