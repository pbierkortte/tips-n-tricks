<div >
    <img src="Git-Logo-2Color.png" align="center" height=100px>
</div>

# How to setup Git
## Optional
### Getting your existing configuration from another machine

```bash
git config --list
```

## Setting up Git

### User Input
```bash
read -p 'Your Name (As you want it shown in the commit log): ' yourName
```

### Email Input
```bash
read -p 'Email Address (123456789+USERNAME@users.noreply.github.com): ' userEmail
```

### Install Git
```bash
if ! [ -x "$(command -v git)" ]; then     sudo apt install git -y; fi
```

### Setup Identity
```bash
git config --global user.name "$yourName"
git config --global user.email "$userEmail"
```

### Use nano editor
```bash
git config --global core.editor "nano -w"
```

### Only push current branch
```bash
git config --global push.default simple
```

### Generate a new key pair
```bash
ssh-keygen -t rsa -b 4096 -C "$(git config --global --get user.email)" -P "" -f ~/.ssh/id_rsa
```

### Start ssh in the background
```bash
eval $(ssh-agent -s)
```

### Add new key to local ssh
```bash
ssh-add ~/.ssh/id_rsa
```

### Show the pub key
```bash
cat ~/.ssh/id_rsa.pub
```

### Copy and paste the key into Github
See [adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

