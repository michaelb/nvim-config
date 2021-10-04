local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup{
  defaults = {
    mappings = {i = {["<esc>"] = actions.close, }},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
	prompt_position = "top",
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {".backup",".swap",".langservers",".session",".undo",".git","node_modules","vendor",".vscode-server",".Desktop",".Documents","classes"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

    -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
   extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf", "mkv","gif"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    },
}
require("telescope").load_extension("media_files")

vim.cmd[[highlight TelescopeBorder guifg=#4c4c4c]]
vim.cmd[[highlight TelescopeSelection guifg=#ffffff guibg=#393939 gui=bold]]
vim.cmd[[highlight TelescopeSelectionCaret guifg=#749484 gui=bold]]

