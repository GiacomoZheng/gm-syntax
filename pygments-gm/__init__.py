from pygments.token import (
	Text, Whitespace,
	String, Comment, 
	Punctuation, Keyword, Operator,
	Generic, Name,
	Error,
)

from pygments.lexer import RegexLexer, bygroups, include, default
from pygments.style import Style

# from pygments import highlight

from pygments.formatters import HtmlFormatter

__all__ = ['GMLexer']

class GMLexer(RegexLexer):
    name = 'gm'
    aliases = ['GM']
    filenames = ['*.gm']

    tokens = {
        'root': [
            (r'\A:', Keyword.Declaration),
			include('gmlang'),
        ],

		'gmlang': [
			include('strings'),
			include('comments'),
			include('invalids'),
			include('brackets'),
			include('keywords'),
			include('quantities'),
			include('whitespaces'),
			# markup.italic.gm
		],

		'whitespaces': [
			(r'(?: |\n|(?<=\n)\t+)(?!:)', Whitespace),
		],

		'strings': [
			(r'\"', String.Double, 'line-strings'),
			(r'(?<!`)`(?!`)', String, 'pre-strings'),
		],
		'line-strings': [
			(r'\\[\w"\n]', String.Escape),
			(r'\\.', String.Escape),
			(r'[^"\n]', String.Double),
			(r'(?<!\\)["\n]', String.Double, '#pop'),
		],
		'pre-strings': [
			(r'[^`]', String),
			(r'`', String, '#pop'),
		],

		'comments': [
			(r';', Comment.Single, 'line-comments'),
			(r'(?<=\A)(\s*)(\[)', bygroups(Whitespace, Comment.Multiline), 'block-comments'),
			(r'(?<=[■(){]|[,:.])(\s*)(\[)', bygroups(Whitespace, Comment.Multiline), 'block-comments'),
		],
		'line-comments': [
			# include('better-comments'),
			(r'[^;\n]+', Comment.Single),
            # (r';\s*', Comment.Special, 'better-comments'),
			(r';', Comment.Single),
			(r'(\n\s*)(\[)', bygroups(Whitespace, Comment.Multiline), ('#pop', 'block-comments')),
			(r'\n', Whitespace, '#pop'),
		],
		'block-comments': [
            # include('better-comments'),
			(r'[^\]]', Comment.Multiline),
			# (r'(^|;)\s*', Comment.Special, 'better-comments'),
			(r'```', Text, 'pre-comments'),
            (r'(\])(\s*)(\[)', bygroups(Comment.Multiline, Whitespace, Comment.Multiline)),
            (r'\]', Comment.Multiline, '#pop')
		],
		'pre-comments': [
			include('gmlang'),
			(r'```', Comment.Multiline, '#pop'),
		],
		'better-comments': [
			(r'(?i:\*|note)[^;\n]*', Generic.Emph, '#pop'),
			(r'(?i:\+|todo)[^;\n]*', Generic.Inserted, '#pop'),
			(r'(?i:\!|warn)[^;\n]*', Generic.Error, '#pop'),
			(r'(?i:\?|wait)[^;\n]*', Generic.Traceback, '#pop'),
		],

		'invalids': [
			(r'(?<=\n|\s|:|[@■]|,|[\(\[]):', Error),
			(r'\w[∀∃!¬]', Error),
			(r'(?<=\A)\s*\.', Error),
			(r'(?<=\n|,|\.)\s*\.', Error),
			(r'[^\t\n]\t+', Error),
		],

		'brackets': [
			(r'(?<![,■({])\s*\[', Punctuation, 'subscripts'),
		],
		'subscripts': [
			include('gmlang'),
			(r'\]', Punctuation, '#pop'),
		],

		'keywords': [
			(r'(?:⇒|⇔|⇐)(?!:)', Keyword), # I'm not sure
			(r':(?!:)', Keyword.Declaration),
			(r'\.(?!\.)', Punctuation),
			(r'[{}()\[\]@■,]', Punctuation),
			(r'(?x)[& ∈∋ ⊆⊇ ⊂⊃ = ∧∨ ∪∩ ∘]', Operator),
		],

		'quantities': [
			(r'([∀∃!¬]+)(?![:.])', Keyword.Type, 'temporaries'),
			(r'[^.\s()\[\],:;{}&|\"`∀∃!¬@■]+', Name),
		],
		"temporaries": [
			(r':', Keyword.Declaration),
			include('gmlang'),
		]

		# 'quantities': [
		# 	include('quantities-use'),
		# 	# include('constants-def'),
		# 	include('temporaries-def'),
		# ],
		# 'quantities-use': [
		# 	(r'(?:([^.\s()\[\],:;{}&|\"`∀∃!¬@■]+\s*)(\.))+', bygroups(Name, Punctuation)),
		# 	(r'[^.\s()\[\],:;{}&|\"`∀∃!¬@■]+', Name, 'quantities-tails'),
		# ],
		# 'quantities-tails': [
		# 	(r':', Keyword.Declaration, '#pop'),
		# 	include('whitespaces'),
		# 	(r'\[', Punctuation, 'subscripts-quantities'),
		# 	# ! (r'\(', Punctuation, 'functions'),
		# 	default('#pop'), # ? I am not sure
		# ],
		# 'subscripts-quantities': [
		# 	include('quantities-use'),
		# 	(r'\]', Punctuation, '#pop'),
		# ],
		# 'functions': [
		# 	include('quantities-use'),
		# 	(r'\)', Punctuation, '#pop'),
		# ],
		# 'temporaries-def': [
		# 	(r'([∀∃!¬])(?![:.])([^.\s()\[\],:;{}&|\"`∀∃!¬@■]+)', bygroups(Keyword.Type, Name.Variable), 'temporaries-tails')
		# 	# (r'([∀∃!¬])(?![:.])([^.\s()\[\],:;{}&|\"`∀∃!¬@■]+)(:)', bygroups(Keyword.Type, Name.Variable, Keyword)),
		# ],
		# 'temporaries-tails': [
		# 	(r':', Keyword.Declaration, '#pop'),
		# 	include('whitespaces'),
		# 	(r'\[', Punctuation, 'temporaries-subscripts'),
		# 	# ! (r'\(', Punctuation, 'functions'),
		# ],
		# 'temporaries-subscripts': [
		# 	include('temporaries-def'),
		# 	include('quantities-use'),
		# 	(r'\]', Punctuation, '#pop'),
		# ],


    }

# class MyStyle(Style):
# 	default_style = ""
#     styles = {
#         Comment:                'italic #888',
#         Keyword:                'bold #005',
#         Name:                   '#f00',
#         Name.Function:          '#0f0',
#         Name.Class:             'bold #0f0',
#         String:                 'bg:#eee #111'
#     }

if __name__ == "__main__":
	print(HtmlFormatter(style='colorful').get_style_defs()) # get css