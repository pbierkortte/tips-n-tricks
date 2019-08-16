# How to setup Git

```sh
# User Input
read -p 'User Name ("Your Name"): ' userName

# Email Input
read -p 'Email Address (you@example.com): ' userEmail

# Setup Identity
git config --global user.name "$userName"
git config --global user.email "$userEmail"

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