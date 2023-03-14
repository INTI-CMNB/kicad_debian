#!/usr/bin/python3
import pcbnew
import re

kicad_version = pcbnew.GetBuildVersion()
m = re.search(r'(\d+)\.(\d+)\.(\d+)(?:\.(\d+))?', kicad_version)
g = m.groups()
if g[3] is None:
   g = g[:3]
print('.'.join(g), end='')

