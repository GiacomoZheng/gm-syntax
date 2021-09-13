-- a mac version of ahk script for gm

-- ==lua-toml==
-- Source: https://github.com/jonstoler/lua-toml

TOML = hs.loadSpoon("toml")
HT = hs.loadSpoon("HammerText")
HT.keywords = TOML.parse([[
#[! gm.toml !]
]])
HT:start()
