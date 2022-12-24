# nvim-numbertoggle

Neovim plugin to automatically toggle between relative and absolute line numbers. Written in Lua.

![demo](https://user-images.githubusercontent.com/56180050/177167997-652a43b1-c94a-4b73-94d6-e4b85fbd4606.gif)

Relative numbers are used in a buffer that has focus and is in normal mode since that's where you move around. They're turned off when you switch out of Vim, switch to another split, or go into insert and command modes.

## Getting started

### Requirements

- Neovim 0.7 or later

### Installation

Use your favorite package manager. Example config with [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use { "sitiom/nvim-numbertoggle" }
```

## Acknowledgment

https://github.com/jeffkreeftmeijer/vim-numbertoggle
