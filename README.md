# nvim-hotline

Minimal Lua wrappers for setting your `'statusline'` and `'tabline'`.

This will format the table/string/function to be passed to either option via standard mechanisms (`vim.o.statusline`, `vim.o.tabline`, etc.).

## Usage

```lua
local hotline = require('hotline')

--- hotline.format() takes X where X is a:
---
--- string
--- function
--- table that contains one or more X
vim.o.statusline = hotline.format {
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

--- The same format is used for tabline so this works too:
vim.o.tabline = hotline.format {
    'same format',
    function() return 'can be used' end,
}

--- You can use this to set the window local statusline too
vim.wo.statusline = hotline.format {'local to window'}
```
