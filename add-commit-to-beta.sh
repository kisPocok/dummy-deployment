#!/bin/bash

# Define a list of commit messages
COMMIT_MESSAGES=(
  "Refactor codebase for improved readability and performance"
  "Fix bug causing crash on startup in production environment"
  "Add unit tests for new feature X"
  "Update dependencies to latest versions for security fixes"
  "Improve error handling in user authentication module"
  "Optimize database queries to reduce load times"
  "Implement new feature Y with corresponding UI updates"
  "Remove deprecated API endpoints and clean up routes"
  "Update documentation to reflect recent changes in API"
  "Fix typo in README and add contributing guidelines"
  "Add logging for debugging purposes"
  "Enhance security for user data storage"
  "Fix layout issues in responsive design"
  "Improve performance of background job processing"
  "Add new user role management features"
  "Correct syntax errors in configuration files"
  "Update translations and localization files"
  "Remove unused variables and imports"
  "Improve caching strategy to reduce server load"
  "Fix issues with session timeout handling"
)

# Get the total number of predefined commit messages
NUM_COMMIT_MESSAGES=${#COMMIT_MESSAGES[@]}

# Function to pick a random commit message
pick_random_commit_message() {
  # Get a random index from the COMMIT_MESSAGES array
  random_index=$((RANDOM % NUM_COMMIT_MESSAGES))
  echo "[AWESOME-123] ${COMMIT_MESSAGES[$random_index]}"
}

# Function to get the current git branch
get_current_branch() {
  git rev-parse --abbrev-ref HEAD
}

# Get the current branch
current_branch=$(get_current_branch)

# Check if the current branch is 'beta'
if [ "$current_branch" != "beta" ]; then
  echo "You are not on the 'beta' branch. You are on branch '$current_branch'."
  echo "Switch to the 'beta' branch to commit your changes."
  exit 1
fi

git fetch origin beta
pick_random_commit_message >> dummy-changes.txt
COMMIT=$(pick_random_commit_message)
git add dummy-changes.txt
git commit -m "$COMMIT"
git push origin beta
