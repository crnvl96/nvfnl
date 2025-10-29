vim.loader.enable()

local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
vim.opt.rtp:prepend(thyme_cache_prefix)

local function bootstrap(url)
    -- To manage the version of repo, the path should be where your plugin manager will download it.
    local name = url:gsub("^.*/", "")
    local path = vim.fn.stdpath("data") .. "/fnl/" .. name
    if not vim.loop.fs_stat(path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            url,
            path,
        })
    end
    vim.opt.runtimepath:prepend(path)
end

bootstrap("https://git.sr.ht/~technomancy/fennel")
bootstrap("https://github.com/aileot/nvim-thyme")

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

bootstrap("https://github.com/aileot/nvim-laurel")

table.insert(package.loaders, function(...)
    return require("thyme").loader(...) -- Make sure to `return` the result!
end)

require("thyme").setup()

vim.cmd("ThymeCacheClear")

require("config")
