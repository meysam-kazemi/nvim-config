
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' 
  use 'phaazon/hop.nvim'
  use 'akinsho/nvim-toggleterm.lua'
  use 'windwp/nvim-autopairs'
  use 'nvim-neotest/nvim-nio'
--  use 'kyazdani42/nvim-tree.lua'
  use({"nvim-neo-tree/neo-tree.nvim",
       requires = {
	    "nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	   }
  })
  --use 'nvim-tree/nvim-web-devicons'
  use 'voldikss/vim-floaterm'
  use 'vim-airline/vim-airline'
  use 'morhetz/gruvbox'
  --use 'ryanoasis/vim-devicons'
  --use 'kyazdani42/nvim-web-devicons' 
  use 'akinsho/bufferline.nvim'
  use 'github/copilot.vim'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'simrat39/rust-tools.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'preservim/tagbar'
  use {
      'stevearc/aerial.nvim',
  }
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  -- do a :TSInstall all 
  use({'nvim-treesitter/nvim-treesitter',
       run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end})
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    })
  use { "ibhagwan/fzf-lua",
     -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" }
    }
  use({ "junegunn/fzf", run = "./install --bin" })
  use({"HUAHUAI23/telescope-dapzzzz"})
  --use({'MunifTanjim/nui.nvim'})
  use({'nvimtools/none-ls.nvim'})
  use({
      "goolord/alpha-nvim",
      requires = {"nvim-tree/nvim-web-devicons"}
  })
  use({
      "yorickpeterse/nvim-window",
  })
  use({
       "folke/trouble.nvim",
       requires={ "nvim-tree/nvim-web-devicons" }
  })
end)

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua', [[v:val =~ '\.lua$' && v:val != 'init.lua']])) do
    require(file:gsub('%.lua$', ''))
end


-- 1. Keymaps to cycle through buffers with gt and gT
-- Although these are often defaults, we set them explicitly for clarity.
vim.keymap.set('n', 'gt', '<Cmd>bnext<CR>', { desc = 'Go to Next Buffer', silent = true })
vim.keymap.set('n', 'gT', '<Cmd>bprevious<CR>', { desc = 'Go to Previous Buffer', silent = true })

-- 2. Keymaps to jump to a buffer by its order number (<leader>1, <leader>2, etc.)
-- This maps <leader>1 to the 1st buffer in the :ls list, <leader>2 to the 2nd, and so on.
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function()
    -- Get a table of all listed buffers, in the order they appear in `:ls`
    local buflist = vim.fn.getbufinfo({ buflisted = 1 })

    -- Check if a buffer exists at the requested position `i`
    if buflist[i] and buflist[i].bufnr then
      -- If it exists, switch to it using its actual buffer number (bufnr)
      vim.cmd('buffer ' .. buflist[i].bufnr)
    else
      -- Optional: Notify the user if the buffer doesn't exist
      print('Buffer ' .. i .. ' does not exist.')
    end
  end, { desc = 'Go to buffer ' .. i, silent = true })
end

