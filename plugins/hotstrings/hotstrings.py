import toml
import os
import sys

from xml.sax.saxutils import escape as xml_esc
import macos_text as macos
import vscode_snipplets as vscode
import espanso

with open("./gm.toml", "r") as handle:
	text_toml = handle.read()
	parsed_toml = toml.loads(text_toml)

backslash_esc = lambda s: s.replace("\\", "\\\\")

################################################
def update(head, body, tail, escape, target):
	text = head

	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = escape(key)
		value = escape(value)
		text += body.format(key=key, value=value)
	text += tail

	with open(target, "w") as handle:
		handle.write(text)

def update_mac_text():
	"""Mac OS text substitution"""
	text = macos.HEAD

	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = escape(key)
		value = escape(value)
		text += macos.BODY.format(key=key, value=value)
	text += macos.TAIL

	with open("./macos_text/gm.plist", "w") as handle:
		handle.write(text)

def update_vscode():
	"""vscode gm snipplet"""

	text = vscode.HEAD
	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = key.replace("\\", "\\\\")
		text += vscode.BODY.format(key=key, value=value)
	text += vscode.TAIL

	with open("./vscode_snipplets/gm.json", "w") as handle:
		handle.write(text)

def update_espanso():
	"""espanso text substitution"""

	text = espanso.HEAD
	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = key.replace("\\", "\\\\")
		text += espanso.BODY.format(key=key, value=value)
	text += espanso.TAIL

	with open("./espanso/gm.yml", "w") as handle:
		handle.write(text)

################################################

if __name__ == "__main__":

	if os.getcwd().endswith("hotstrings"):
		# update_mac_text()
		# update_vscode()
		update_espanso()
