local M = {}

function M.setup()
   local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

   vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
      pattern = "*",
      group = augroup,
      callback = function()
         if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.opt.relativenumber = true
         end 
      end,
   })

   vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
      pattern = "*",
      group = augroup,
      callback = function()
         if vim.o.nu then
            vim.opt.relativenumber = false
         end
      end,
   })

   vim.api.nvim_create_autocmd("CmdlineEnter", {
      pattern = "*",
      group = augroup,
      callback = function()
         if vim.o.nu then
            vim.opt.relativenumber = false
            vim.cmd "redraw"
         end
      end,
   })
end

return M
