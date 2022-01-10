local options = {
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = {"menuone", "noselect"},
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	showmode = false,
	showtabline = 4,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 10,
	sidescrolloff = 10,
	termguicolors = true,
}
vim.opt.shortmess:append "c"

for k,v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
