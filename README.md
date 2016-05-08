# Universal Chrome host

Universal host for messages from `Chrome` browser extensions sent via `sendNativeMessage`.

## Install
* `curl https://bootstrap.pypa.io/ez_setup.py -o - | python`
* `easy_install simplejson`
* Setup extension ids allowed to access this host in `by.styx.run.json` -> `allowed_origins`
* run `install.sh`
* restart `Chrome`

##Logging

Enabling logging in Chrome can help find problems finding the manifest.
Quit Chrome first.

```open -a Google\ Chrome --args --enable-logging --v=1```

View the log like this:

```tail -f ~/Library/Application\ Support/Google/Chrome/chrome_debug.log```
