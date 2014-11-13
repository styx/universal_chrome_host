#!/usr/bin/env python

import struct
import sys
import simplejson
import os

# Read the message length
text_length_bytes = sys.stdin.read(4)
if len(text_length_bytes) == 0:
	sys.exit(0)
msg_len = struct.unpack('i', text_length_bytes)[0]

# Load message
json = simplejson.loads(sys.stdin.read(msg_len).decode('utf-8'))
url = json['srcUrl']
programm = json['bin']
basename = os.path.basename(url)
tmp_path = '/tmp'

quoted_path = '"' + tmp_path + '/' + basename + '"'

# Fetch the file
os.system('wget -c "' + json['srcUrl'] + '" -O ' + quoted_path)
# Open the file
os.system('/usr/bin/env ' + programm + ' ' + quoted_path)
