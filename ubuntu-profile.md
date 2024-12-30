# Profile Configuration Guide

The `~/.profile` file in Linux/Ubuntu is a shell script that runs when you log in. It's particularly useful for setting up your environment with custom configurations, PATH modifications, and automated tasks that should run at login.This makes it the ideal place for personalizing your environment and automating routine tasks.

## Understanding .profile

- Executed by the command interpreter for login shells
- Not read by bash if `~/.bash_profile` or `~/.bash_login` exists
- Commonly used for:
  - Setting environment variables
  - Modifying PATH
  - Running login-time scripts
  - Setting up custom functions

## Understanding ~/.bash_profile vs ~/.bash_login

Bash follows this specific order when looking for login shell initialization files:
1. `~/.bash_profile` - Checked first, if found, others are ignored
2. `~/.bash_login` - Checked only if .bash_profile doesn't exist
3. `~/.profile` - Checked only if neither of the above exist

This means:
- If `~/.bash_profile` exists, both `~/.bash_login` and `~/.profile` are ignored
- If `~/.bash_profile` doesn't exist but `~/.bash_login` does, `~/.profile` is ignored
- `~/.profile` is only read if neither of the above exist

To ensure your `.profile` is always sourced, add this to your `~/.bash_profile` (or `~/.bash_login` if using that instead):

```bash
# Source .profile if it exists
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
```

This ensures your profile configurations work regardless of which login file exists.

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
