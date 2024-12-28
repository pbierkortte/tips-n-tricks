# Ubuntu
## Increase Swap Size
Step by step guide to increase swap size in Ubuntu 22.04

1. Check current swap space:
```bash
sudo swapon --show
```

2. Turn off existing swap:
```bash
sudo swapoff /swapfile
```

3. Create a new swap file with desired size (e.g., 8GB):
```bash
sudo fallocate -l 8G /swapfile
```

4. Set correct permissions:
```bash
sudo chmod 600 /swapfile
```

5. Set up the swap area:
```bash
sudo mkswap /swapfile
```

6. Activate the new swap file:
```bash
sudo swapon /swapfile
```

7. Make the changes permanent by editing /etc/fstab:
```bash
sudo nano /etc/fstab
```
Add or modify the line:
```
/swapfile swap swap defaults 0 0
```

8. Verify the new swap size:
```bash
sudo swapon --show
# or
free -m
```

Note: If fallocate fails, you can use dd instead:
```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=8192
```

Reboot your system to ensure changes take effect.
