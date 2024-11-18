local Remap = require("onedapperterm.utils.remap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

-- temporal while I fix nvimtree
nnoremap("<leader>t", vim.cmd.Ex)

--LINE COPY OPTIONS
nnoremap("ˆ", "yyP")
nnoremap("ı", "yyp")
nnoremap("º", ":m .+1<CR>==")
nnoremap("∆", ":m .-2<CR>==")
inoremap("ˆ", "<Esc>yyP==gi")
inoremap("ı", "<Esc>yyp==gi")
inoremap("º", "<Esc>:m .+1<CR>==gi")
inoremap("∆", "<Esc>:m .-2<CR>==gi")
vnoremap("ˆ", "y'>p")
vnoremap("ı", "y`>p`<gv")
vnoremap("º", ":m '>+1<CR>gv=gv")
vnoremap("∆", ":m '<-2<CR>gv=gv")

--SPLITS NAVIGATION
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
inoremap("<C-h>", "<C-w>h")
inoremap("<C-l>", "<C-w>l")
vnoremap("<C-h>", "<C-w>h")
vnoremap("<C-l>", "<C-w>l")
nnoremap("<S-up>", "<C-w>k")
nnoremap("<S-down>", "<C-w>j")
nnoremap("<leader>q", ":only<CR>")
nnoremap("<leader>v", ":vsplit<CR>")

--BUFFERS NAVIGATION
nnoremap("<s-tab>", ":bprevious<CR>")
nnoremap("<tab>", ":bnext<CR>")
nnoremap("<s-q>", ":bd<CR>")
nnoremap("«", ":tabclose<CR>")


--SOME NICE MOVES
nnoremap("<s-l>", "$")
nnoremap("<s-h>", "_")
vnoremap("<s-l>", "$h")
vnoremap("<s-h>", "_")
nnoremap("ª", "b")
nnoremap("@", "w")					                        --accidentally remaped the @ for the macros :/
vnoremap("ª", "b")
vnoremap("@", "w") 					                        --accidentally remaped the @ for the macros :/
nnoremap("<leader>m", "@") 				                    --but running them with leader + m is actually better :D
vnoremap("<leader>m", "@") 				                    --but running them with leader + m is actually better :D

-- OTHER UTILITIES
nnoremap("<esc><esc>", ":silent! nohls<cr>") 		        -- hide higlight of searching
nnoremap("<leader>j", "gqj") 				                --Arrange if line height limit (I think :P)
xnoremap("<leader>p", "\"_dP") 				                --Paste without loosing current register
nnoremap("y", '"*y')					                    --Copy to system clipboard on normal
vnoremap("y", '"*y')					                    --Copy to system clipboard on visual
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])--Search and replace current word

-- TELESCOPE
-- nnoremap("<leader>r", ":Telescope lsp_references layout_strategy=bottom_pane<CR><ESC>")
-- nnoremap("<leader>d", ":Telescope lsp_definitions layout_strategy=bottom_pane<CR><ESC>")
-- nnoremap("<leader>lo", ":Telescope git_bcommits<CR><ESC>")
-- nnoremap("<C-p>", ":Telescope find_files<CR>")
-- nnoremap("<leader>ll", ":Telescope live_grep layout_strategy=bottom_pane<CR>")
-- inoremap("<C-p>", "<Esc>:Telescope find_files<CR>==gi")
-- vnoremap("<C-p>", ":Telescope find_files<CR>gv==gv")
--
