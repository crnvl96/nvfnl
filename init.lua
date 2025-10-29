local function bootstrap(url, ref)
    local pack = "tangerine"
    local name = url:gsub(".*/", "")

    local path = vim.fn.stdpath("data") .. "/site/pack/" .. pack .. "/start/" .. name

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system { "git", "clone", url, path }
        if ref then
            vim.fn.system { "git", "-C", path, "checkout", ref }
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

bootstrap("https://github.com/udayvir-singh/tangerine.nvim", "v2.9")
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim", "v1.7")

require "tangerine".setup {}
