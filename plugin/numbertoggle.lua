local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

local function is_disabled(buf)
   if vim.g.numbertoggle_disable then
      return true
   end
   if not vim.api.nvim_buf_is_valid(buf) then
      return nil
   end
   return vim.b[buf or 0].numbertoggle_disable
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function(args)
      if is_disabled(args.buf) then
         return
      end
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function(args)
      if is_disabled(args.buf) then
         return
      end
      if vim.o.nu then
         vim.opt.relativenumber = false
         -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
         -- Workaround for https://github.com/neovim/neovim/issues/32068
         if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
            vim.cmd "redraw"
         end
      end
   end,
})
