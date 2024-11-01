function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- return { "rose-pine/neovim", name = "rose-pine", config = function() ColorMyPencils() end}

return { "ellisonleao/gruvbox.nvim", priority = 1000 , config = function ()
    ColorMyPencils()
end, opts = ...}
