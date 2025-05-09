local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require("catppuccin").setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = {   -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false,   -- shows the '~' characters after the end of buffers
  term_colors = false,          -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,            -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,          -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,            -- Force no italic
  no_bold = false,              -- Force no bold
  no_underline = false,         -- Force no underline
  styles = {                    -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },    -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = function(colors)
    local highlights = {}

    local spell_options = { style = { "undercurl" }, fg = colors.red }
    local spell_groups = { "SpellBad", "SpellCap", "SpellLocal", "SpellRare" }
    for _, v in ipairs(spell_groups) do
      highlights[v] = spell_options
    end

    return highlights
  end,
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.cmd("au BufNewFile,BufRead Jenkinsfile setf groovy")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.api.nvim_set_option("clipboard", "unnamed")
