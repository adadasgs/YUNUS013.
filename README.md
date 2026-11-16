# YUNUS013

SwiftUI prototype for iPhone/iPad. The repository builds an IPA through GitHub Actions; no Mac is needed on your side.

## Build an IPA from Windows

1. Open **Settings → Secrets and variables → Actions** in this repository.
2. Add these repository secrets:
   - `IOS_CERTIFICATE_BASE64` — Base64 of your Apple signing certificate exported as a password-protected `.p12`.
   - `IOS_CERTIFICATE_PASSWORD` — password used for that `.p12`.
   - `IOS_PROVISIONING_PROFILE_BASE64` — Base64 of an Ad Hoc provisioning profile for bundle ID `com.yunus013.panel`, containing the devices where you will install the app.
   - `IOS_TEAM_ID` — your Apple Developer Team ID.
3. Push to `main` or open **Actions → Build YUNUS013 IPA → Run workflow**.
4. When the run succeeds, open the run and download the **YUNUS013-IPA** artifact.

To create Base64 values in Windows PowerShell:
```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\path\to\certificate.p12")) | Set-Clipboard
[Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\path\to\profile.mobileprovision")) | Set-Clipboard
```
Run each command separately and paste the result into the matching GitHub secret. Never commit certificates, profiles, passwords, or private keys to the repository.

## Important limitations

This is a standalone UI prototype. Its controls do not modify Oxide: Survival Island. A normal iOS app cannot inject code into Oxide, inspect its private game state, or draw a freely movable overlay above another app. The Skibidi icon in this prototype is displayed only inside YUNUS013. The app does not implement an aimbot, ESP, or wallhack.
