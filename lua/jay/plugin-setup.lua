local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugin-setup.lua source <afile> | PackerCompile
augroup end
]])


local ok, packer = pcall(require, "packer")

if not ok then return end


return packer.startup(function(use)
    -- packer itself, required.
    use { "wbthomason/packer.nvim" }
    -- lua api that many plugins use
    use { "nvim-lua/plenary.nvim" }
    -- colorschemes
    use { "bluz71/vim-nightfly-guicolors" }
    use { "catppuccin/nvim", as = "catppuccin" }
    -- tmux & split window navigation
    use { "christoomey/vim-tmux-navigator" }
    use { "szw/vim-maximizer" }   -- maximize and restore split window
    -- essential plugins
    use { "tpope/vim-surround" }
    use { "vim-scripts/ReplaceWithRegister" }
    -- comment with gc
    use { "numToStr/Comment.nvim" }
    -- file explore, nvim-tree
    use { "nvim-tree/nvim-tree.lua" }
    -- icons
    use { "kyazdani42/nvim-web-devicons" }
    -- status line
    use { "nvim-lualine/lualine.nvim" }
    -- fuzzy finder
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
    -- auto completion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }
    -- LSP
    ----- 1. managing
    use { "williamboman/mason.nvim" }
    ----- 2. configuring
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }
    use { "glepnir/lspsaga.nvim", branch = "main" }
    use { "jose-elias-alvarez/typescript.nvim" }
    use { "onsails/lspkind.nvim" }
    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- -- treesitter configuration
    -- use({
    --     "nvim-treesitter/nvim-treesitter",
    --     run = function()
    --         local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    --         ts_update()
    --     end,
    -- })

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    -- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use { "feline-nvim/feline.nvim" }
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
