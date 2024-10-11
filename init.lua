vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local success, _ = pcall(vim.api.nvim_buf_del_keymap, 0, 'n', '<C-L>')
        if not success then
            return
        end
    end,
})


require("theprimeagen")
