----------------
--- KEYBINDS ---
----------------

local opts = {noremap = true, silent = true} -- non-mapped only
local all = {'n', 'i', 'v', 'c', 'o',}

-- Remap hjkl to jkl;
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', ';', 'l')

-- Disable q: command-line window, also pgup/down and f1 help
vim.keymap.set(all, '<F1>', '<Nop>', opts)
vim.keymap.set(all, '<PageUp>', '<Nop>', opts)
vim.keymap.set(all, '<PageDown>', '<Nop>', opts)
vim.keymap.set('n', 'q:', '<Nop>', opts)

-- Save file with Ctrl-s
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<CR>', opts)

-- Copy selected text to clipboard
vim.opt.clipboard = 'unnamedplus'

-- Copy whole file
vim.keymap.set({'n', 'i', 'v'}, '<C-a>', function()
    local saved_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd('normal! ggyG')
    vim.api.nvim_win_set_cursor(0, saved_cursor)
end, opts)

-- Toggle window transparency
vim.keymap.set({'n', 'i', 'v'}, '<C-t>', ':TransparentToggle<CR>', opts)

-- Clear search highlights with leader-n
vim.keymap.set('n', '<leader>n', ':noh<CR>', opts)

-- Show (print()) messages
vim.keymap.set('n', '<leader>m', ':messages<CR>', opts)

-- Open Mason
vim.keymap.set('n', '<leader>lm', ':Mason<CR>', opts)

-- Manipulate active LSP
vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>:LspRestart<CR>', opts)
vim.keymap.set('n', '<leader>ls', ':LspStart<CR>:LspStart<CR>', opts)
vim.keymap.set('n', '<leader>lt', ':LspStop<CR>:LspStop<CR>', opts)
vim.keymap.set('n', '<leader>ld', ':lua ShowDiagnosticUnderCursor()<CR>', opts)

-- Swap 'f' and 't' functionalities for deletion
vim.keymap.set('n', 'df', 'dt', opts)
vim.keymap.set('n', 'yf', 'yt', opts)
vim.keymap.set('n', 'cf', 'ct', opts)

-- And vice versa
vim.keymap.set('n', 'dt', 'df', opts)
vim.keymap.set('n', 'yt', 'yf', opts)
vim.keymap.set('n', 'ct', 'cf', opts)

-- Easier way to get to the end and beginning of a line
vim.keymap.set('n', 'E', '$', opts)
vim.keymap.set('n', 'B', '<Home>', opts)


-- vim.keymap.set('n', '<ScrollWheelUp>', '<C-y>', opts)
-- vim.keymap.set('n', '<ScrollWheelDown>', '<C-e>', opts)

-- Toggle wrap and nowrap
local function toggle_wrap()
  if vim.o.wrap then
    vim.cmd('set nowrap')
  else
    vim.cmd('set wrap')
  end
end
vim.keymap.set('n', '<leader>w', function() toggle_wrap() end, opts)

-- Window management
local function new_split(type, direction)
    return function()
        if direction == 'v' then
            vim.cmd('vsplit')
        elseif direction == 'h' then
            vim.cmd('split')
        end
        if type == 't' then
            vim.cmd('terminal')
        end
        vim.cmd('set laststatus=3')
    end
end
vim.keymap.set('n', '<leader>tt', new_split('t', 't'), opts)
vim.keymap.set('n', '<leader>tv', new_split('t', 'v'), opts)
vim.keymap.set('n', '<leader>th', new_split('t', 'h'), opts)
vim.keymap.set('n', '<leader>v', new_split('n', 'v'), opts)
vim.keymap.set('n', '<leader>h', new_split('n', 'h'), opts)

-- Focus different window
vim.keymap.set('n', '<leader><Up>', '<C-w>k', opts)
vim.keymap.set('n', '<leader><Down>', '<C-w>j', opts)
vim.keymap.set('n', '<leader><Left>', '<C-w>h', opts)
vim.keymap.set('n', '<leader><Right>', '<C-w>l', opts)
-- Move window
vim.keymap.set('n', '<leader><leader><Up>', '<C-w>K', opts)
vim.keymap.set('n', '<leader><leader><Down>', '<C-w>J', opts)
vim.keymap.set('n', '<leader><leader><Left>', '<C-w>H', opts)
vim.keymap.set('n', '<leader><leader><Right>', '<C-w>L', opts)

-- Text shortcuts
-- error handling in Go
vim.keymap.set('i', '<C-n>', 'if err != nil {\n\t\n}<Up><End>', opts)
vim.keymap.set('n', '<C-n>', 'iif err != nil {\n\t\n}<Up><End>', opts)

-- LazyGit
-- Keybinding for LazyGit with automatic 'n' input if not in a Git repo
vim.keymap.set('n', '<leader>lg', function()
  if vim.loop.fs_stat(".git") then
    vim.cmd('FloatermNew lazygit')
  else
    vim.cmd('FloatermNew lazygit')
    vim.defer_fn(function()
      vim.fn.feedkeys('n\r')
    end, 10)
    vim.defer_fn(function()
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('4<Down>', true, true, true))
    end, 10)
  end
end, { noremap = true, silent = true })

-- Yazi
vim.keymap.set('n', '<leader>y', ':Yazi<CR>')

-- In-line comment
vim.keymap.set({'n', 'v'}, '<leader>/', ':normal gcc<CR>', opts)
-- Open Telescope
local builtin = require('telescope.builtin')

-- Find files in cwd and ~/.findables/
vim.keymap.set('n', '<leader>ff', ':lua require("telescope.builtin").find_files({find_command={"fd", "--type", "f", "--follow", "--exclude", ".git/", "--search-path", vim.fn.expand("~").."/.findables", "--search-path", "."},layout_strategy="horizontal", layout_config={width=0.99, height=0.99, preview_width=0.6}})<CR>', opts)
-- Find my personal notes in ~/.notes/
vim.keymap.set('n', '<leader>fn', ':lua require("telescope.builtin").find_files({find_command={"fd", "--type", "f", "--follow", "--exclude", ".git/", "--search-path", vim.fn.expand("~").."/.notes"},layout_strategy="horizontal", layout_config={width=0.99, height=0.99, preview_width=0.6}})<CR>', opts)
-- Search for content in cwd
vim.keymap.set('n', '<leader>fg', ':lua require("telescope.builtin").live_grep({layout_strategy="horizontal", layout_config={width=0.99, height=0.99, preview_width=0.6}})<CR>', opts)
-- Open file browser
vim.keymap.set('n', '<leader>b', ':lua require("telescope").extensions.file_browser.file_browser({cwd = vim.fn.expand("%:p:h"), layout_strategy = "horizontal", layout_config = {width = 0.99, height = 0.99, preview_width = 0.5}})<CR>', opts)

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.wo.wrap = true
  end,
})

vim.keymap.set('n', 's', ':SnR<CR>', opts)


vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- help
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})   -- buffers
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})   -- keymaps

vim.keymap.set('n', '<leader>c', ':CopilotChatToggle<CR>', {})
vim.keymap.set('n', '<leader>gm', ':CopilotChatModels<CR>', {})

vim.keymap.set('n', '<leader>ts', ':Telescope symbols<CR>', {})

vim.keymap.set('n', '<leader>tp', ':Telescope projects<CR>', {})

vim.keymap.set('n', '<leader>gf', ':silent! !gofmt -w %<CR>', opts)

-- Autogenerate docstrings
vim.keymap.set('n', '<leader>ng', ':Neogen<CR>', opts)

-- Change tab size
local function change_ts()
  local nts = vim.opt.tabstop:get() * 2
  if nts >= 16 then nts = 2 end
  vim.opt.tabstop, vim.opt.softtabstop, vim.opt.shiftwidth = nts,nts,nts
  print("New tab size = " .. vim.opt.tabstop:get())
end
vim.keymap.set('n', '<leader><Tab>', change_ts, opts)

-- Sync Packer
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>', opts)

-- Set custom characters for split borders
vim.opt.fillchars = {
  vert =      '│', -- Vertical line
  horiz =     '─', -- Horizontal line
  horizup =   '┴', -- Horizontal line going up
  horizdown = '┬', -- Horizontal line going down
  vertleft =  '┤', -- Vertical line going left
  vertright = '├', -- Vertical line going right
  verthoriz = '┼'  -- Vertical and horizontal intersection
}

-- Define highlights for active and inactive windows
vim.cmd('highlight ActiveWindowLineNr guifg=#ffffff')
vim.cmd('highlight InactiveWindowLineNr guifg=#545454')
vim.cmd('highlight ActiveCursorLineNr guifg=#ff9e64')

-- Function to highlight the active window's line numbers
local function highlight_active_window()
  -- vim.cmd('setlocal cursorline')
  vim.opt.cursorline = true
  vim.cmd('setlocal winhighlight=LineNrAbove:ActiveWindowLineNr,LineNrBelow:ActiveWindowLineNr,CursorLineNr:ActiveCursorLineNr')
end

-- Function to highlight the inactive window's line numbers
local function highlight_inactive_window()
  -- vim.cmd('setlocal cursorline')
  vim.opt.cursorline = false
  vim.cmd('setlocal winhighlight=LineNrAbove:InactiveWindowLineNr,LineNrBelow:InactiveWindowLineNr')
end


-- Zettelkasten keybinds
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
vim.keymap.set("n", "<leader>zT", "<cmd>Telekasten new_templated_note<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("n", "<leader>zm", ":edit " .. vim.fn.expand("~/zettelkasten/hub.md<CR>"))

-- Call insert link automatically when we start typing a link
vim.api.nvim_create_autocmd("FileType", {
  pattern = "telekasten",
  callback = function()
    -- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
  end,
})


vim.keymap.set('n', '<leader>po', ':PeekOpen<CR>', opts)
vim.keymap.set('n', '<leader>pc', ':PeekClose<CR>', opts)
vim.keymap.set('n', '<leader>pt', ':RenderMarkdown toggle<CR>', opts)

local mk = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>a', mk.add_file, opts)
vim.keymap.set('n', '<leader><leader><leader>', ui.toggle_quick_menu, opts)
vim.keymap.set('n', '<A-1>', function() ui.nav_file(1) end, opts)
vim.keymap.set('n', '<A-2>', function() ui.nav_file(2) end, opts)
vim.keymap.set('n', '<A-3>', function() ui.nav_file(3) end, opts)
vim.keymap.set('n', '<A-4>', function() ui.nav_file(4) end, opts)
vim.keymap.set('n', '<A-5>', function() ui.nav_file(5) end, opts)
vim.keymap.set('n', '<A-6>', function() ui.nav_file(6) end, opts)
vim.keymap.set('n', '<A-7>', function() ui.nav_file(7) end, opts)
vim.keymap.set('n', '<A-8>', function() ui.nav_file(8) end, opts)
vim.keymap.set('n', '<A-9>', function() ui.nav_file(9) end, opts)


-- Implement line highlighting
local priority_highlights = {"String", "WarningMsg", "ErrorMsg", "Normal",}
local namespace = vim.api.nvim_create_namespace('highlight_namespace')
local function highlight_line(category)
  local cur_line = vim.fn.line('.')
  vim.api.nvim_buf_clear_namespace(0, namespace, cur_line, cur_line)
  vim.api.nvim_buf_add_highlight(0, namespace, priority_highlights[category], cur_line - 1, 0, -1)
end
vim.keymap.set('n', '<leader>p', function () highlight_line(tonumber(vim.fn.nr2char(vim.fn.getchar()))) end, opts)


-- For NeoVim dashboard
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "dashboard" then
      -- vim.cmd("IBLDisable") -- Disable for dashboard
      vim.opt_local.cursorline = false
      vim.defer_fn(function()
        vim.cmd("set laststatus=0") -- Disable lualine for dashboard
      end, 10) -- Delay by 10ms
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat", -- Adjust this if the chat buffer uses a different filetype
  callback = function()
    vim.keymap.set("i", "<Tab>", "<Tab>", { buffer = true }) -- Restore default <Tab> behavior
  end,
})

-- Show the statusline only once for all buffers
vim.api.nvim_create_autocmd({'BufWinEnter', 'BufEnter'}, {
  callback = function()
    vim.cmd('set laststatus=3')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.b.indent_blankline_enabled = false
  end,
})

-- Autocommand to highlight active window on entering
vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter"}, {
  callback = function()
    highlight_active_window()
  end,
})

-- Autocommand to highlight active window on entering
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    vim.cmd('stopinsert')
  end,
})

-- Autocommand to highlight inactive window on leaving
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    highlight_inactive_window()
  end,
})

-- Initial setup for all open windows
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    local windows = vim.api.nvim_list_wins()
    for _, win in ipairs(windows) do
      vim.api.nvim_set_current_win(win)
      if win == current_win then
        highlight_active_window()
      else
        highlight_inactive_window()
      end
    end
    vim.api.nvim_set_current_win(current_win)
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end
})

----------------------
--- CUSTOMIZATIONS ---
----------------------

-- Check if Neovim was started with a directory
local function open_file_browser()
  local argv = vim.fn.argv()
  if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
    vim.cmd('Telescope file_browser path=' .. argv[1])
    -- vim.cmd('lua require("telescope").extensions.file_browser.file_browser({path="' .. argv[1] .. '", layout_strategy="horizontal", layout_config={width=0.99, height=0.99, preview_width=0.5}})')
    -- vim.api.nvim_input('<BS>')
    -- Open mini file browser
    -- require('mini.files').open(argv[1])
    -- vim.cmd("Yazi")

  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = open_file_browser,
})



