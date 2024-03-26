local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- reccommended settings from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netwrkPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])

nvimtree.setup({
	view = {
		side = "right",
		adaptive_size = true,
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enabled = false,
			},
		},
	},
})
