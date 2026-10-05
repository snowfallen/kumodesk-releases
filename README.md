<p align="center"><img src="pictures/icon.png" width="120" alt="kumodesk"></p>

# kumodesk

An infinite board for your windows. Web pages, notes, tasks, a calendar, tables, pictures and
terminals stand side by side on one board that you move around and zoom, instead of piling up
behind each other. It is made for anyone who works at a computer, not only for programmers.

![An empty board asks what to start with](pictures/welcome.png)

## Download

Take the file for your system from the [latest release](../../releases/latest).

| System  | File                                                                 |
| ------- | -------------------------------------------------------------------- |
| macOS   | `kumodesk-…-arm64.dmg` for Apple silicon, `kumodesk-….dmg` for Intel |
| Windows | `kumodesk-…-setup.exe`                                               |
| Linux   | `kumodesk-….AppImage`, or `kumodesk_…_amd64.deb`                     |

## Install

**macOS.** Open the `.dmg` and drag kumodesk to Applications. The app is not signed yet, so
macOS refuses to start it the first time ("Apple could not verify…"). Press **Done**, then
open **System Settings → Privacy & Security**, scroll down to the line about kumodesk and press
**Open Anyway**. This is needed once. The same from Terminal:
`xattr -dr com.apple.quarantine /Applications/kumodesk.app`

**Windows.** Run the setup. If SmartScreen stops it, choose **More info**, then **Run anyway**.

**Linux.** Make the AppImage executable (`chmod +x kumodesk-*.AppImage`) and run it, or install
the `.deb` with your package manager.

## Your data

Everything you make stays on your computer, in the app's own folder. Nothing is sent anywhere.

## Something is wrong?

Tell us in [Issues](../../issues): what you did, what you expected and what happened instead.
A screenshot helps.
