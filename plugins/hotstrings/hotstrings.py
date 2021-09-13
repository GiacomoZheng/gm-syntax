with open("./Hammerspoon/template.lua", "r") as handle:
	text = handle.read()

with open("./gm.toml", "r") as handle:
	# print(handle.read())
	text = text.replace("#[! gm.toml !]", handle.read())

with open("./Hammerspoon/init.lua", "w") as handle:
	handle.write(text)
	