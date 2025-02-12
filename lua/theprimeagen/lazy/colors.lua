function ColorMyPencils(color)
	color = color or "vscode"
	vim.cmd.colorscheme(color)
--    vim.o.background("dark")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return { "Mofiqul/vscode.nvim", config = function() ColorMyPencils() end}


-- return { "ellisonleao/gruvbox.nvim", priority = 1000 , config = function ()
--     ColorMyPencils()
-- end, opts = ...}
