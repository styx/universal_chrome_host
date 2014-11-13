#!/bin/sh -e

DOMAIN=by.styx.run

SETTINGS_DIR="$HOME/.config/google-chrome-beta/NativeMessagingHosts"

mkdir -p "$SETTINGS_DIR"

cp "./$DOMAIN.json" "$SETTINGS_DIR"
cp "./$DOMAIN.py"   "$SETTINGS_DIR"

WRAPPER_PATH="$SETTINGS_DIR/$DOMAIN.py"

ESCAPED_WRAPPER_PATH=${WRAPPER_PATH////\\/}

sed -i -e "s/WRAPPER_PATH/$ESCAPED_WRAPPER_PATH/" "$SETTINGS_DIR/$DOMAIN.json"

chmod o+r "$SETTINGS_DIR/$DOMAIN.json"
chmod 755 "$SETTINGS_DIR/$DOMAIN.py"
