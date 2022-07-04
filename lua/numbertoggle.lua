local M = {}

function M.setup()
   local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

   vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
      pattern = "*",
      group = augroup,
      callback = function()
         if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.wo.relativenumber = true
         end
      end,
   })

   vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
      pattern = "*",
      group = augroup,
      callback = function()
         if vim.o.nu then
            vim.wo.relativenumber = false
         end
      end,
   })
end

return M
