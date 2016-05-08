#!/usr/bin/env python

import struct
import sys
import subprocess
import os
import platform
import json
import tempfile
import base64

# Read the message length
text_length_bytes = sys.stdin.read(4)
if len(text_length_bytes) == 0:
	sys.exit(0)

msg_len = struct.unpack('i', text_length_bytes)[0]

# Load message
message = sys.stdin.read(msg_len).decode('utf-8')
json = json.loads(message)

data = base64.b64decode(json['data'])
programm = json['bin']
temp_name = next(tempfile._get_candidate_names()) + '.png'
out_path = '/tmp/' + temp_name

if platform.system() == 'Darwin':
    programm = '/Applications/' + programm.capitalize() + '.app/Contents/MacOS/' + programm

out_file = open(out_path, 'w')
out_file.write(data)
out_file.close()

command = '/usr/bin/env ' + programm + ' ' + out_path + ' > /tmp/native_host.log'

os.system(command)
