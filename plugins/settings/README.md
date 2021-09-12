For the functions of `better-comment`, add the following settings into your `settings.json` please.

```json
// For a better visual effect, I used whitespaces here
{
    // editor
    "editor.fontFamily": "Consolas, 'Cambria Math', 'Courier New', monospace",
    "editor.tokenColorCustomizations": {
        "textMateRules": [
            {
                "name": "Comment - todo",
                "scope": [
                    "comment.todo.gm"
                ],
                "settings": {
                    "foreground": "#FF8C00"
                }
            },
            {
                "name": "Comment - note",
                "scope": [
                    "comment.note.gm"
                ],
                "settings": {
                    "foreground": "#98C379"
                }
            },
            {
                "name": "Comment - wait",
                "scope": [
                    "comment.wait.gm"
                ],
                "settings": {
                    "foreground": "#3498DB"
                }
            },
            {
                "name": "Comment - warn",
                "scope": [
                    "comment.warn.gm"
                ],
                "settings": {
                    "foreground": "#FF2D00"
                }
            },

            {
                "scope": [
                    "comment",
                    "string",
                    "constant",
                    "variable"
                ],
                "settings": {
                    "fontStyle": "italic"
                }
            },
            {
                "scope": [
                    "punctuation",
                    "string.regexp",
                    "entity.name.function",
                    "meta.embedded.block"
                ],
                "settings": {
                    "fontStyle": ""
                }
            }
        ]
    },
}
```
