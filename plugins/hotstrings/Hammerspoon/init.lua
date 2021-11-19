-- a mac version of ahk script for gm

-- ==lua-toml==
-- Source: https://github.com/jonstoler/lua-toml

TOML = hs.loadSpoon("toml")
HT = hs.loadSpoon("HammerText")
HT.keywords = TOML.parse([[
# 数学符号
"in/." = "∈"
"in\\." = "∋"
"subseteq/." = "⊆"
"subset/." = "⊂"
"supseteq/." = "⊇"
"supset/." = "⊃"

# option L --> ¬
# option 8 --> •
# option 5 --> ∞
# option < --> ≤
# option > --> ≥
# option = --> ≠
# option shift + --> ±
# option d --> ∂
# option b --> ∫

"~</." = "≺"
"~>/." = "≻"
"~≤/." = "≼" # only for mac
"~≥/." = "≽" # only for mac
"~=" = "≌"

"=>/." = "⇒"
"<=/." = "⇐"
"<=>/."	= "⇔"
"->/." = "→"
"<-/." = "←"
"<->/." = "↔"
"|->/." = "↦"
"<-|/." = "↤"

"||/." = "‖"

_comment1 = """
; 右ctrl +
	>^0::Send,∅

	>^-::Send,¯

	>^.::Send,̇
	:*?:...	::…
	
	>^a::Send,∀
	>^e::Send,∃
	>^1::Send,¬

	+>^a::Send,∧  ; wedge product / smash product
	+>^v::Send,∨  ; wedge sum

	>^u::Send,∪
	>^n::Send,∩
	+>^u::Send,⋃
	+>^n::Send,⋂

	>^m::Send,■
	+>^m::Send,□

	>^o::Send,∘

	+>^o::Send,◉

	+>^+::Send,⊕

	>^x::Send,×
	+>^x::Send,⊗
;
"""

# ? changing some letter to be capital will change the output to be capital
"alpha/." = "α"

"gamma/." = "γ"
"delta/." = "δ"
"epsilon/." = "ε"

# beta, theta and zeta need to be above the eta
"beta/." = "β"
"zeta/." = "ζ"
"theta/." = "θ"
"eta/." = "η"

"iota/." = "ι"
"kappa/." = "κ"
"lambda/." = "λ"
"mu/." = "μ"
"nu/." = "ν"
"xi/." = "ξ"
"omicron/." = "ο"
"pi/." = "π"
"rho/." = "ρ"
"sigma/." = "σ"
"tau/." = "τ"
"upsilon/." = "υ"
"phi/." = "φ"
"chi/." = "χ"
"psi/." = "ψ"
"omega/." = "ω"

# 希伯来文 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

"aleph/." = "א" # 亦写作
"alef/." = "א"

# 双线字体, lua 会报错大部分
"aa/." = "𝕒"
"bb/." = "𝕓"
"cc/." = "𝕔"
"dd/." = "𝕕"
"ee/." = "𝕖"
"ff/." = "𝕗"
"gg/." = "𝕘"
"hh/." = "𝕙"
"ii/." = "𝕚"
"jj/." = "𝕛"
"kk/." = "𝕜"
"ll/." = "𝕝"
"mm/." = "𝕞"
"nn/." = "𝕟"
"oo/." = "𝕠"
"pp/." = "𝕡"
"qq/." = "𝕢"
"rr/." = "𝕣"
"ss/." = "𝕤"
"tt/." = "𝕥"
"uu/." = "𝕦"
"vv/." = "𝕧"
"ww/." = "𝕨"
"xx/." = "𝕩"
"yy/." = "𝕪"
"zz/." = "𝕫"

"AA/." = "𝔸"
"BB/." = "𝔹"
"CC/." = "ℂ"
"DD/." = "𝔻"
"EE/." = "𝔼"
"FF/." = "𝔽"
"GG/." = "𝔾"
"HH/." = "ℍ"
"II/." = "𝕀"
"JJ/." = "𝕁"
"KK/." = "𝕂"
"LL/." = "𝕃"
"MM/." = "𝕄"
"NN/." = "ℕ"
"OO/." = "𝕆"
"PP/." = "ℙ"
"QQ/." = "ℚ"
"RR/." = "ℝ"
"SS/." = "𝕊"
"TT/." = "𝕋"
"UU/." = "𝕌"
"VV/." = "𝕍"
"WW/." = "𝕎"
"XX/." = "𝕏"
"YY/." = "𝕐"
"ZZ/." = "ℤ"

# 手写体 mathcal &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"A/.c" = "𝒜"
"a/.c" = "𝒶"

"B/.c" = "ℬ"
"b/.c" = "𝒷"

"C/.c" = "𝒞"
"c/.c" = "𝒸"

"D/.c" = "𝒟"
"d/.c" = "𝒹"

"E/.c" = "ℰ"
"e/.c" = "ℯ"

"F/.c" = "ℱ"
"f/.c" = "𝒻"

"G/.c" = "𝒢"
"g/.c" = "ℊ"

"H/.c" = "ℋ"
"h/.c" = "𝒽"

"I/.c" = "ℐ"
"i/.c" = "𝒾"

"J/.c" = "𝒥"
"j/.c" = "𝒿"

"K/.c" = "𝒦"
"k/.c" = "𝓀"

"L/.c" = "ℒ"
"l/.c" = "𝓁"

"M/.c" = "ℳ"
"m/.c" = "𝓂"

"N/.c" = "𝒩"
"n/.c" = "𝓃"

"O/.c" = "𝒪"
"o/.c" = "ℴ"

"P/.c" = "𝒫"
"p/.c" = "𝓅"

"Q/.c" = "𝒬"
"q/.c" = "𝓆"

"R/.c" = "ℛ"
"r/.c" = "𝓇"

"S/.c" = "𝒮"
"s/.c" = "𝓈"

"T/.c" = "𝒯"
"t/.c" = "𝓉"

"U/.c" = "𝒰"
"u/.c" = "𝓊"

"V/.c" = "𝒱"
"v/.c" = "𝓋"

"W/.c" = "𝒲"
"w/.c" = "𝓌"

"X/.c" = "𝒳"
"x/.c" = "𝓍"

"Y/.c" = "𝒴"
"y/.c" = "𝓎"

"Z/.c" = "𝒵"
"z/.c" = "𝓏"

# 花体 mathfrak &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"A/.f" = "𝔄"
"a/.f" = "𝔞"

"B/.f" = "𝔅"
"b/.f" = "𝔟"

"C/.f" = "ℭ"
"c/.f" = "𝔠"

"D/.f" = "𝔇"
"d/.f" = "𝔡"

"E/.f" = "𝔈"
"e/.f" = "𝔢"

"F/.f" = "𝔉"
"f/.f" = "𝔣"

"G/.f" = "𝔊"
"g/.f" = "𝔤"

"H/.f" = "ℌ"
"h/.f" = "𝔥"

"I/.f" = "ℑ"
"i/.f" = "𝔦"

"J/.f" = "𝔍"
"j/.f" = "𝔧"

"K/.f" = "𝔎"
"k/.f" = "𝔨"

"L/.f" = "𝔏"
"l/.f" = "𝔩"

"M/.f" = "𝔐"
"m/.f" = "𝔪"

"N/.f" = "𝔑"
"n/.f" = "𝔫"

"O/.f" = "𝔒"
"o/.f" = "𝔬"

"P/.f" = "𝔓"
"p/.f" = "𝔭"

"Q/.f" = "𝔔"
"q/.f" = "𝔮"

"R/.f" = "ℜ"
"r/.f" = "𝔯"

"S/.f" = "𝔖"
"s/.f" = "𝔰"

"T/.f" = "𝔗"
"t/.f" = "𝔱"

"U/.f" = "𝔘"
"u/.f" = "𝔲"

"V/.f" = "𝔙"
"v/.f" = "𝔳"

"W/.f" = "𝔚"
"w/.f" = "𝔴"

"X/.f" = "𝔛"
"x/.f" = "𝔵"

"Y/.f" = "𝔜"
"y/.f" = "𝔶"

"Z/.f" = "ℨ"
"z/.f" = "𝔷"

_comment2 = """
# ; 中文标点输入&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# 	>!`::Send,、
# 	>!.::Send,。
# 	>!,::Send,，
# 	>!;::Send,；
# 	>!+;::Send,：
# 	>!'::Send,‘’{left}
# 	>!"::Send,“”{left}
# 	>!?::Send,？
# 	>!!::Send,！
# 	>!(::Send,（）{left}
# 	>!)::Send,）
# 	>!+,::Send,《》{left}
# 	>!+.::Send,》
"""

# 杂项
"female/." = "♀"
# the female must be in front of male
"male/." = "♂"

"Sun/." = "☉"
"Mercury/." = "☿"
"Venus/." = "♀"
"Earth/." = "♁"
"Moon/." = "☾"
"Mars/." = "♂"
"Jupiter/." = "♃"
"Saturn/." = "♄"
"Uranus/." = "⛢"
"Neptune/." = "♆"

]])
HT:start()