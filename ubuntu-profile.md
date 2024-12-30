# Profile Customization Guide

The `~/.profile` file in Linux/Ubuntu is a shell script that runs when you log in. It's particularly useful for setting up your environment with custom configurations, PATH modifications, and automated tasks that should run at login.

## Understanding .profile

- Executed by the command interpreter for login shells
- Not read by bash if `~/.bash_profile` or `~/.bash_login` exists
- Commonly used for:
  - Setting environment variables
  - Modifying PATH
  - Running login-time scripts
  - Setting up custom functions

## Example: Automatic Permission Management

Here's a useful example of how to add automatic permission management to your `~/.profile`:

```bash
########################################################
#
# Automatic Permission Management
#
function secure_folder() {
    chmod 700 "$1"
    setfacl -R -m u::rwx,g::---,o::--- "$1"    # Set current permissions
    setfacl -d -m u::rwx,g::---,o::--- "$1"    # Set default for new files
}
#
# Apply on login
secure_folder ~/private
#
########################################################
```

### Usage

1. Add the function to your `~/.profile`
2. Add `secure_folder` calls for each directory you want to secure
3. The permissions will be applied automatically on each login
