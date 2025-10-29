vim.loader.enable()

local mini_path = vim.fn.stdpath 'data' .. '/site/pack/deps/start/mini.nvim'
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(mini_path) then
    vim.cmd 'echo "Installing `mini.nvim`" | redraw'
    local origin = 'https://github.com/nvim-mini/mini.nvim'
    local clone_cmd = { 'git', 'clone', '--filter=blob:none', origin, mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd 'packadd mini.nvim | helptags ALL'
    vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

require('mini.deps').setup()

MiniDeps.add 'https://git.sr.ht/~technomancy/fennel'
MiniDeps.add 'https://github.com/aileot/nvim-thyme'
MiniDeps.add 'https://github.com/aileot/nvim-laurel'

local thyme_cache_prefix = vim.fn.stdpath 'cache' .. '/thyme/compiled'
vim.opt.rtp:prepend(thyme_cache_prefix)

table.insert(package.loaders, function(...) return require('thyme').loader(...) end)

require('thyme').setup()

require 'config'
