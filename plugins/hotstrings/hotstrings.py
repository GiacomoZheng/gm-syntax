import toml
import os
import sys

from xml.sax.saxutils import escape

root = "./plugins/hotstrings/"

with open(os.path.join(root, "gm.toml"), "r") as handle:
	text_toml = handle.read()
	parsed_toml = toml.loads(text_toml)

################################################
def vscode():
	"""vs code gm snipplet"""
	# with open(os.path.join(root, "vscode-snipplets/template.json"), "r") as handle:
	# 	template = handle.read()

	text = "{"
	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = key.replace("\\", "\\\\")
		
		text += """
	"{}": {{
		"prefix": "{}",
		"body": "{}"
	}},
""".format(key + " : " + value, key, value)

	text += """
	"_": {
		"body": ""
	}
}
"""

	with open(os.path.join(root, "vscode-snipplets/gm.json"), "w") as handle:
		handle.write(text)

################################################
def macos():
	"""macos text Substitutions"""
	# with open(os.path.join(root, "text-macos/template.plist"), "r") as handle:
	# 	template = handle.read()

	text = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>"""

	for (key, value) in parsed_toml.items():
		if key.startswith("_"):
			continue
		key = escape(key)
		
		text += """
	<dict>
		<key>phrase</key>
		<string>{}</string>
		<key>shortcut</key>
		<string>{}</string>
	</dict>""".format(value, key)

	text += """
</array>
</plist>
"""

	with open(os.path.join(root, "text-macos/gm.plist"), "w") as handle:
		handle.write(text)

if __name__ == "__main__":

	ls = sys.argv[1:]

	if len(ls) != 0:
		for term in ls:
			eval(term + "()") # call functions
	else:
		vscode()
		macos()