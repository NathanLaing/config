local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"angular",
		"bicep",
		"rust",
		"go",
		"yaml",
		"html",
		"css",
		"markdown",
		"lua",
		"vim",
		"gitignore",
	},
	auto_install = true,
})
