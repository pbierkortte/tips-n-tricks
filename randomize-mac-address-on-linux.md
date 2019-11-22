<div >
    <img src="Git-Logo-2Color.png" align="center" height=100px>
</div>

# How to randomize your MAC address on a Linux machine
1. Do a web search with duckduckgo for "generate mac address"

2. Note the MAC address

2.  Open the ternminal

3. Get a root shell
```bash
sudo -i
```

4. Get the device name
```bash
ip link show
```

5. Note device name (ex: enp0s25)

6. Clear the device record (may be optional)
```bash
ip link set dev DEVICENAMEHERE
```

7. Set the new MAC address 
```bash
ip link set dev DEVICENAMEHERE address NEWMACADDRESSHERE
```

8. Restart the device, appling the new MAC address
```bash
ip link set dev DEVICENAMEHERE up
```

9. Verify that the MAC has changed
```bash
ip link show
```

10. Close the root terminal
```bash 
logout
```
