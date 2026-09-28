return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        local parsers = {
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash",
        }

        -- install parsers, then start the highlighter on matching filetypes
        vim.defer_fn(function()
            require("nvim-treesitter").install(parsers):wait(300000)
        end, 0)

        -- filetype names don't always match parser names (e.g. bash parser -> "sh" filetype,
        -- typescript parser -> "typescriptreact" for tsx) — list the actual vim filetypes here
        local filetypes = {
            "vim", "javascript", "typescript", "typescriptreact", "c", "lua", "rust",
            "sh", "markdown",
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
