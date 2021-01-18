local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = "/tmp/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute "packadd packer.nvim"

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost minimal_init.lua PackerCompile]]
vim.cmd [[autocmd BufWritePost minimal_init.lua PackerInstall]]

local use = require('packer').use
require("packer").startup(
  {
    function()
      use {'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
      }
      use {'sunjon/telescope-frecency',
        requires = {{'tami5/sql.nvim'}}
      }
    end,
    config = {package_root = "/tmp/site/pack"}
  }
)


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  }
}
require('telescope').load_extension("frecency")
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true})
