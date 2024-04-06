
local M = {}

-- Colorscheme to its directory name mapping, because colorscheme repo name is not necessarily
-- the same as the colorscheme name itself.
M.colorscheme_conf = {
  onedark = function()
    vim.cmd([[colorscheme onedark]])
  end,
  edge = function()
    vim.g.edge_enable_italic = 1
    vim.g.edge_better_performance = 1

    vim.cmd([[colorscheme edge]])
  end,
  sonokai = function()
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1

    vim.cmd([[colorscheme sonokai]])
  end,
  gruvbox_material = function()
    -- foreground option can be material, mix, or original
    vim.g.gruvbox_material_foreground = "material"
    --background option can be hard, medium, soft
    vim.g.gruvbox_material_background = "soft"
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd([[colorscheme gruvbox-material]])
  end,
  everforest = function()
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_better_performance = 1

    vim.cmd([[colorscheme everforest]])
  end,
  nightfox = function()
    vim.cmd([[colorscheme nordfox]])
  end,
  catppuccin = function()
    -- available option: latte, frappe, macchiato, mocha
    vim.g.catppuccin_flavour = "frappe"
    require("catppuccin").setup()

    vim.cmd([[colorscheme catppuccin]])
  end,
  onedarkpro = function()
    -- set colorscheme after options
    vim.cmd('colorscheme onedark_vivid')
  end,
  material = function()
    vim.g.material_style = "oceanic"
    vim.cmd('colorscheme material')
  end,
}

-- Set the colorscheme to the one specified in the environment variable
local colorscheme = vim.env.COLORSCHEME or "onedarkpro"
M.colorscheme_conf[colorscheme]()

if vim.g.logging_level == "debug" then
  local msg = "Colorscheme: " .. colorscheme

  vim.notify(msg, vim.log.levels.DEBUG, { title = "nvim-config" })
end
