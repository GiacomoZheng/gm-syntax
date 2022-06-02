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
	update(macos.HEAD, macos.BODY, macos.TAIL, xml_esc, "./macos_text/gm.plist")

def update_vscode():
	"""vscode gm snipplet"""
	update(vscode.HEAD, vscode.BODY, vscode.TAIL, backslash_esc, "./vscode_snipplets/gm.json")

def update_espanso():
	"""espanso text substitution"""
	update(espanso.HEAD, espanso.BODY, espanso.TAIL, backslash_esc, "./espanso/gm.yml")

################################################

if __name__ == "__main__":

	if os.getcwd().endswith("hotstrings"):
		update_mac_text()
		update_vscode()
		update_espanso()
