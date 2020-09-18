#!/usr/bin/env python3

import json, plistlib, sys

i = sys.argv[1]
o = sys.argv[2]

data = json.load(open(i))
with open(o, "wb") as f:
    plistlib.dump(data, f)