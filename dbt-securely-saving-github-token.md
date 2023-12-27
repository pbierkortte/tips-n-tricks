# Securely set environment variables for local development with DBT packages

## Problem
When using DBT packages for local development sometimes you need to set up an environment variable with a GitHub PAT token

Usually, this entails using a GitHub Personal Access Token (PAT) to authenticate with GitHub.

```yml
# packages.yml
packages:
  - git: "https://{{env_var('DBT_ENV_SECRET_GITHUB_TOKEN')}}@github.com/your-organization/your-repo"
```

## Solution
Here is a bit of code for setting up a GitHub Personal Access Token to be used securely within the user's shell environment. So, you do not have to worry about manually setting environment variables. Note this assumes you are using MacOS.

```zsh
# Unset token (optional)
unset DBT_ENV_SECRET_GITHUB_TOKEN

# Show that the token is unset (optional)
echo $DBT_ENV_SECRET_GITHUB_TOKEN

# Capture the token securely from user input
echo -n "Enter your GitHub token: "; read -s token; echo

# Capture the username fron user input
echo -n "Enter your GitHub username: "; read username; echo

# Add token to keychain
security add-generic-password -U -s github -a "$username" -w "$token"

# Setup the token retrieval snippet
retrieval_snippet='export DBT_ENV_SECRET_GITHUB_TOKEN=$(security find-generic-password -w -s github -a '$username')'

# Add snippet to .zshrc file, if not already present.
grep -q "$retrieval_snippet" ~/.zshrc
if [ $? -ne 0 ]; then
    echo "adding retrieval snippet to .zshrc"
    echo -e "\n$retrieval_snippet\n" >> ~/.zshrc
fi

# Restart zshell
exec zsh

# Show that the token is set (optional)
echo $DBT_ENV_SECRET_GITHUB_TOKEN
```

# Explanation
This code is setting up authentication with GitHub using a personal access token. Storing the token securely in the keychain and exporting it only for the current user's shell, allows authenticating with GitHub without exposing the secret token in plain text.

* It prompts the user to enter their GitHub username and personal access token, reading them securely without echoing to the terminal.
* The token is stored in the MacOS keychain using security, associated with the GitHub account name.
* It then sets up a snippet to retrieve the token from the keychain.
* This retrieval snippet is added to the user's .zshrc file, exporting the token into an environment variable.
