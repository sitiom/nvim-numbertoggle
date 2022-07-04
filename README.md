# nvim-numbertoggle

Neovim plugin to automatically toggle between hybrid and absolute line numbers. Written in Lua.

## Getting started

### Requirements

- Neovim 0.7 or later

### Installation

Use your favorite package manager. Example config with [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
   "sitiom/nvim-numbertoggle",
   config = function()
      require("numbertoggle").setup()
   end
}
```

## Acknowledgment

https://github.com/jeffkreeftmeijer/vim-numbertoggle
