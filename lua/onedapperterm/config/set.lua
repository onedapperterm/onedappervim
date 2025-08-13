--TABULATION SETTINGS
vim.opt.tabstop = 4            -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4        -- Number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 4         -- Number of spaces used for each step of (auto)indent
vim.opt.expandtab = true       -- Convert tabs to spaces

--INDENT SETTINGS
vim.opt.smartindent = true     -- Automatically insert indents in code
vim.opt.wrap = false           -- Disable line wrapping

--FILE SETTINGS
vim.opt.swapfile = false       -- Disable swap file creation
vim.opt.backup = false         -- Disable backup file creation
vim.opt.undofile = true        -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files

--SEARCHING SETTINGS
vim.opt.hlsearch = true        -- Highlight all search results
vim.opt.incsearch = true       -- Show search results incrementally as you type

--APPEARANCE
vim.opt.nu = true              -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.scrolloff = 8          -- Minimum lines to keep above and below the cursor
vim.opt.signcolumn = "yes"     -- Always show the sign column
vim.opt.isfname:append("@-@")  -- Append '@-@' to the 'isfname' option
vim.opt.cmdheight = 1          -- Set command line height
vim.opt.shortmess:append("c")  -- Avoid showing extra messages in command line

--UFO FOLDING SETTINGS
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99           -- Using UFO provider need a large value
vim.o.foldenable = true

--SPELLCHECK
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.spelloptions:append("noplainbuffer")

--OTHERS
vim.opt.errorbells = false     -- Disable error bells
vim.opt.updatetime = 50        -- Faster completion (default is 4000ms)
vim.g.mapleader = " "          -- Set leader key to space


vim.cmd [[set iskeyword+=-]]   --Take words joined with - as one
