vim.o.tabstop = 2       -- Number of spaces per tab
vim.o.expandtab = true  -- Use spaces instead of tabs
vim.o.softtabstop = 2   -- Number of spaces for editing operations
vim.o.shiftwidth = 2    -- Number of spaces for auto-indentation
vim.o.number = true
vim.g.mapleader = " "
vim.g.editorconfig = false

-- Create an autocommand group for custom file-type-specific settings
vim.api.nvim_create_augroup("FileTypeSpecificSettings", {clear = true})

-- Blade specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypeSpecificSettings",
  pattern = "blade.php",
  callback = function ()
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end
})

-- PHP specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypeSpecificSettings",
  pattern = "php",
  callback = function ()
    vim.bo.tabstop = 4
    vim.bo.expandtab = false
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})
