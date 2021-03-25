# nvim-hotline

Minimal Lua wrappers for setting your `'statusline'` and `'tabline'`.

## Usage

```lua
local hotline = require('hotline')

--- hotline.statusline() takes X where X is a:
---
--- string
--- function
--- table that contains one or more X
hotline.statusline {
    'provide a string',
    'the string can have things like %f %l %c', -- see :h 'statusline'
    function()
        return 'provide a function'
    end,
    {
        'provide another table',
        function()
            return 'some more text'
        end
    }
}
```
