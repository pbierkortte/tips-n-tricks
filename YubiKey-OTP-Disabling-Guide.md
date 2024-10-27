# YubiKey OTP Disabling Guide


## Why Disable OTP?
Disabling YubiKey OTP (One-Time Password) functionality is beneficial if you frequently experience accidental triggers, especially with models like the Nano that remain inserted in USB ports. This change allows for more controlled use of your YubiKey while still leveraging its robust security features for authentication.

### Benefits of Disabling OTP
* **Prevents Accidental Activation**: Stops your YubiKey from generating codes when unintentionally touched.
* **Enhanced Privacy**: Reduces the risk of accidentally leaking sensitive information through unintended OTP generation.
* **Reduced Embarrassment**: Avoids situations where unwanted OTP codes are generated and transmitted unexpectedly.
* **Improved Security**: Minimizes potential privacy risks associated with accidental OTP generation.

### Understanding the Risks
#### Privacy Implications
##### Device ID Leakage
Each OTP contains a unique device ID that:
- Remains constant across all codes
- Can be used for device tracking
- Links different activities to the same YubiKey
- Creates a persistent identifier

#### OPSEC Concerns
Particularly important for:
- Security researchers
- Privacy advocates
- Individuals requiring anonymity
- Those working with sensitive information


### Additional Considerations
#### Impact on Other YubiKey Functions
- Disabling OTP doesn't affect other YubiKey functions
- FIDO2, U2F, and PIV capabilities remain active
- Changes persist across different computers
- Configuration survives power cycles


## Install
### Prerequisites
1. Add Yubico repository
```bash
sudo apt-add-repository ppa:yubico/stable
sudo apt update
```
2. Install required packages
```bash
sudo apt install opensc-pkcs11 pcscd libfido2-1 fido2-tools
```
3. Start pcscd service
```bash
sudo systemctl start pcscd
```
### YubiKey Manager
1. Install
```bash
sudo apt install yubikey-manager
```
2. Verify
```bash
ykman list
```

## Disabling
### Using YubiKey Manager (ykman)
```bash
ykman config usb --disable otp
```

### Using YubiKey Manager GUI
1. Launch YubiKey Manager
2. Open navigation window
3. Select your YubiKey device
4. Navigate to the "Toggle Applications" section
5. Find the "OTP" application and click on it
6. Click the "Disable" button
7. Confirm the action when prompted



