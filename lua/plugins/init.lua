local fn = vim.fn

--Automatically install packer:
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system{
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print("Installing packer close and reopen Neovim...")
	vim.cmd [[ packadd packer.nvim]]
end

--Autocommand that reloads neovim whenever you save the plugins/init.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost init.lua source <afile> | PackerSync
	augroup end
]]

--Use  a protected call so we dont get error out on first use
local status_ok, packer = pcall(require,"packer")
if not status_ok then
	vim.notify("packer is not getting started")
	return
end

--Have packer  use a popup window
packer.init{
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded"}
		end,
	},
}

--Install your plugins here
return packer.startup(function(use)
    --My plugins:
	use "wbthomason/packer.nvim" 			--packer manager itself
	use "nvim-lua/popup.nvim"			    -- An implementation of the popup API from vim in neovim
	use "nvim-lua/plenary.nvim"             --Useful lua functions used lots of plugins
    --Color scheme:
    use {"dracula/vim",as="dracula"}        --dracula color scheme
	-- cmp plugins
  	use{
        "hrsh7th/nvim-cmp", -- The completion plugin
  	    requires ={
            {"hrsh7th/cmp-buffer", after="nvim-cmp"}, -- buffer completions
  	        {"hrsh7th/cmp-path", after="nvim-cmp"}, -- path completions
  	        {"hrsh7th/cmp-cmdline",after="nvim-cmp"}, -- cmdline completions
  	        {"saadparwaiz1/cmp_luasnip",after="nvim-cmp"},-- snippet completions
  	        {"hrsh7th/cmp-nvim-lsp",after="nvim-cmp"},
        },
    }
  	-- snippets
  	use "L3MON4D3/LuaSnip" --snippet engine
  	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

