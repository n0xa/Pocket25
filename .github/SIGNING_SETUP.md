# GitHub Secrets Setup for Signing

To enable signed builds in GitHub Actions, you need to add the following secrets to your repository:

## Required Secrets

Go to: https://github.com/SarahRoseLives/Pocket25/settings/secrets/actions

Add these secrets:

### 1. KEYSTORE_BASE64
The base64-encoded keystore file. Get it by running:
```bash
cd example/android/app
base64 -w 0 pocket25-release-key.jks
```
Copy the entire output and paste it as the secret value.

### 2. KEYSTORE_PASSWORD
Value: `pocket25`

### 3. KEY_PASSWORD
Value: `pocket25`

### 4. KEY_ALIAS
Value: `pocket25`

## How to Add Secrets

1. Go to repository Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add each secret with the exact names above
4. Once all 4 secrets are added, the workflows will be able to sign builds

## Security Note

Never commit the actual keystore file (`.jks`) or `key.properties` to git.
They are already in `.gitignore`.
