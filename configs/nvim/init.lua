-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.o.shell = "zsh -i"

-- Augment
vim.g.augment_workspace_folders = { "/Users/adamsoderstrom/Documents/adamsoderstrom/www/projects/radarpar/app" }
vim.g.augment_disable_completions = true

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function() vim.opt_local.makeprg = "tsx %" end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function() vim.opt_local.makeprg = "node %" end,
})

require "lazy_setup"
require "polish"
