This folder includes the `init.lua` source file of me.

The below tutorial is coppied from [maxandersen's gist](https://gist.github.com/maxandersen/d09ebef333b0c7b7f947420e2a7bbbf5). You need to do something similar to [jonstoler.lua-toml](https://github.com/jonstoler/lua-toml/blob/master/toml.lua)

```lua
--[[ 
    === HammerText ===
    Based on: https://github.com/Hammerspoon/hammerspoon/issues/1042

    How to "install":
    - Simply copy and paste this code in your "init.lua".

    How to use:
      - Add this init.lua to ~/.hammerspoon/Spoons/HammerText.spoon
      - Add your hotstrings (abbreviations that get expanded) to the "keywords" list following the example format.
      
      ht = hs.loadSpoon("HammerText")
      ht.keywords ={
         nname = "Max Rydahl Andersen",
         xdate = function() return os.date("%B %d, %Y") end,
      }
      ht:start()


   
    Features:
    - Text expansion starts automatically in your init.lua config.
    - Hotstring expands immediately.
    - Word buffer is cleared after pressing one of the "navigational" keys.
      PS: The default keys should give a good enough workflow so I didn't bother including other keys.
          If you'd like to clear the buffer with more keys simply add them to the "navigational keys" conditional.

    Limitations:
    - Can't expand hotstring if it's immediately typed after an expansion. Meaning that typing "..name..name" will result in "My name..name".
      This is intentional since the hotstring could be a part of the expanded string and this could cause a loop.
      In that case you have to type one of the "buffer-clearing" keys that are included in the "navigational keys" conditional (which is very often the case).

--]]
```