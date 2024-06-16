vim.loader.enable()

local core_conf_files = {
  "globals.lua",      -- some global settings
  "options.vim",      -- setting options in nvim
  "autocommands.vim", -- various autocommands
  "mappings.lua",     -- all the user-defined mappings
  "plugins.vim",      -- all the plugins installed and their configurations
  "colorschemes.lua", -- colorscheme settings
}

local viml_conf_dir = vim.fn.stdpath("config") .. "/viml_conf"
-- source all the core config files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/%s", viml_conf_dir, file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end
