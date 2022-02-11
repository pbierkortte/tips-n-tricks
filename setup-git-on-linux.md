<div >
    <img src="Git-Logo-2Color.png" align="center" height=100px>
</div>

# Optional - Getting your existing configuration from another machine
```sh
git config --list
```

# How to setup Git

```sh
# User Input
read -p 'User Name ("Your Name"): ' userName

# Email Input
read -p 'Email Address (you@example.com): ' userEmail

# Install Git
if ! [ -x "$(command -v git)" ]; then     sudo apt install git -y; fi

# Setup Identity
git config --global user.name "$userName"
git config --global user.email "$userEmail"

# Use nano editor
git config --global core.editor "nano -w"

# Only push current branch
git config --global push.default simple

# Generate a new key pair
ssh-keygen -t rsa -b 4096 -C "$userEmail" -P "" -f ~/.ssh/id_rsa

# Start ssh in the background
eval $(ssh-agent -s)

# Add new key to local ssh
ssh-add ~/.ssh/id_rsa

# Show the pub key
cat ~/.ssh/id_rsa.pub
```

## Copy and paste the key into Github
