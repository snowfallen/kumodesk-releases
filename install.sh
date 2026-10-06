#!/bin/sh
# Installs or updates kumodesk on macOS and Linux:
#   curl -fsSL https://raw.githubusercontent.com/snowfallen/kumodesk-releases/main/install.sh | sh
# A version other than the latest: KUMODESK_VERSION=0.1.0 before `sh`.
set -eu

REPO="https://github.com/snowfallen/kumodesk-releases"

say() { printf '%s\n' "$*"; }
fail() { printf 'kumodesk: %s\n' "$*" >&2; exit 1; }

command -v curl >/dev/null 2>&1 || fail "curl is needed"

version="${KUMODESK_VERSION:-}"
if [ -z "$version" ]; then
  latest=$(curl -fsSLI -o /dev/null -w '%{url_effective}' "$REPO/releases/latest") ||
    fail "cannot reach $REPO"
  version="${latest##*/v}"
fi
case "$version" in
  *[!0-9.]* | '') fail "cannot tell the latest version" ;;
esac

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
fetch() {
  say "Downloading $1"
  curl -fL --progress-bar -o "$tmp/$1" "$REPO/releases/download/v$version/$1" ||
    fail "cannot download $1"
}

case "$(uname -s)" in
  Darwin)
    case "$(uname -m)" in
      arm64) arch="arm64" ;;
      *) arch="x64" ;;
    esac
    if pgrep -xi kumodesk >/dev/null 2>&1; then
      fail "Kumodesk is running: quit it and run this again"
    fi
    file="kumodesk-$version-$arch-mac.zip"
    # Versions before 0.1.4 named the file for Intel without the word.
    if [ "$arch" = "x64" ] && ! curl -fsIL -o /dev/null "$REPO/releases/download/v$version/$file"; then
      file="kumodesk-$version-mac.zip"
    fi
    fetch "$file"
    /usr/bin/ditto -x -k "$tmp/$file" "$tmp/app"
    app=$(find "$tmp/app" -maxdepth 1 -name '*.app' | head -n 1)
    [ -n "$app" ] || fail "the download holds no app"
    dest="/Applications"
    [ -w "$dest" ] || dest="$HOME/Applications"
    mkdir -p "$dest"
    # Earlier versions were called kumodesk.app; on most disks that is the same name.
    rm -rf "$dest/kumodesk.app" "$dest/Kumodesk.app"
    name=$(basename "$app")
    mv "$app" "$dest/$name"
    /usr/bin/xattr -dr com.apple.quarantine "$dest/$name" 2>/dev/null || true
    say "Kumodesk $version is in $dest. Start it from Launchpad or: open -a Kumodesk"
    ;;
  Linux)
    [ "$(uname -m)" = "x86_64" ] || fail "only x86_64 Linux is built so far"
    if command -v apt-get >/dev/null 2>&1; then
      file="kumodesk_${version}_amd64.deb"
      fetch "$file"
      chmod 644 "$tmp/$file"
      chmod 755 "$tmp"
      if [ "$(id -u)" = 0 ]; then
        apt-get install -y "$tmp/$file"
      else
        command -v sudo >/dev/null 2>&1 || fail "sudo is needed to install the package"
        sudo apt-get install -y "$tmp/$file"
      fi
      say "kumodesk $version is installed. Start it from the applications menu or: kumodesk"
    else
      file="kumodesk-$version.AppImage"
      fetch "$file"
      home="${XDG_DATA_HOME:-$HOME/.local/share}"
      mkdir -p "$home/kumodesk" "$home/applications" "$HOME/.local/bin"
      mv "$tmp/$file" "$home/kumodesk/kumodesk.AppImage"
      chmod +x "$home/kumodesk/kumodesk.AppImage"
      ln -sf "$home/kumodesk/kumodesk.AppImage" "$HOME/.local/bin/kumodesk"
      cat >"$home/applications/kumodesk.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=kumodesk
Comment=An infinite board for your windows
Exec=$home/kumodesk/kumodesk.AppImage %U
Terminal=false
Categories=Office;Utility;
DESKTOP
      say "kumodesk $version is in $home/kumodesk. Start it from the applications menu or: ~/.local/bin/kumodesk"
    fi
    ;;
  *)
    fail "this script is for macOS and Linux; on Windows see $REPO#install"
    ;;
esac
