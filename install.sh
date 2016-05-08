#!/bin/sh -e

DOMAIN=by.styx.run

if [ $(uname) == 'Darwin' ]
then
  # OS X
  SETTINGS_DIR="$HOME/Library/Application Support/Google/Chrome/NativeMessagingHosts"
else
  # Linux
  SETTINGS_DIR="$HOME/.config/google-chrome-beta/NativeMessagingHosts"
fi

mkdir -p "$SETTINGS_DIR"

cp "./$DOMAIN.json" "$SETTINGS_DIR"
cp "./$DOMAIN.py"   "$SETTINGS_DIR"

WRAPPER_PATH="$SETTINGS_DIR/$DOMAIN.py"

ESCAPED_WRAPPER_PATH=${WRAPPER_PATH////\\/}

sed -i -e "s/WRAPPER_PATH/$ESCAPED_WRAPPER_PATH/" "$SETTINGS_DIR/$DOMAIN.json"

rm "$SETTINGS_DIR/$DOMAIN.json-e"

chmod o+r "$SETTINGS_DIR/$DOMAIN.json"
chmod 755 "$SETTINGS_DIR/$DOMAIN.py"
