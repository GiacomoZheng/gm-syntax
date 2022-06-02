
HEAD = "{"

BODY = """
	"{key} : {value}": {{
		"prefix": "{key}",
		"body": "{value}"
	}},
"""

TAIL = """
	"_": {
		"body": ""
	}
}
"""