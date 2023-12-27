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

# Show that the token is unset
print $DBT_ENV_SECRET_GITHUB_TOKEN

# Capture the token securely fron user input
echo -n "Enter your GitHub token: "; read -s token

# Capture the token securely fron user input
echo -n "Enter your GitHub username: "; read username

# Add token to keychain
security add-generic-password -U -s github -a "$username" -w "$token"

# Setup the token retrieval snippet
retrieval_snippet="security find-generic-password -w -s github -a "$username

# Add token to .zshrc file
echo -e '\nexport DBT_ENV_SECRET_GITHUB_TOKEN=$('$retrieval_snippet')\n' >> ~/.zshrc

# Tail the last 3 lines of the zshrc file to show how the token is set.
cat ~/.zshrc | tail -n 3

# Restart zshell
exec zsh

# Show that the token is set
echo $DBT_ENV_SECRET_GITHUB_TOKEN
```

# Explanation
This code is setting up authentication with GitHub using a personal access token. Here's what it's doing:

It first unsets any existing token stored in an environment variable. Then it prints that variable to confirm it's unset.

It then prompts the user to enter their GitHub username and personal access token, reading them securely without echoing to the terminal.

The token is stored in the macOS keychain using security, associated with the GitHub account name.

It then sets up a snippet to retrieve the token from the keychain.

This retrieval snippet is added to the user's .zshrc file, exporting the token into an environment variable.

Finally, it tails the .zshrc to show how the token is being set on every new shell session.

Storing the token securely in the keychain and exporting it only for the current user's shell, allows authenticating with GitHub without exposing the secret token in plain text.
