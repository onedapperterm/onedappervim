local Remap = require("onedapperterm.utils.remap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

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

-- FOR SOME PLUGINS
nnoremap("<leader>ff", ":NvimTreeFindFile<CR>")
nnoremap("<leader>t", function()                            --Close Undotree and Toggle Nvimtree 
    vim.cmd("UndotreeHide")
    vim.cmd("NvimTreeToggle")
end)
nnoremap("<leader>u", function()                            --Close Nvimtree and Toggle Undotree 
    vim.cmd("NvimTreeClose")
    vim.cmd("UndotreeToggle")
end)
nnoremap("<leader>cm", function()                           --Show comments on telescope
    vim.cmd("TodoTelescope")
    vim.schedule(function() vim.cmd("stopinsert") end)
end)


-- DIFF UNDO -- Fix and implement

function DiffUndoWithFile()
  -- Get the alternate buffer (should be your file buffer)
  local file_buf = vim.fn.bufnr('#')
  if file_buf < 1 then
    print("No alternate buffer found!")
    return
  end
  -- Get the lines from the file buffer (note: lines are 0-indexed in the API)
  local file_lines = vim.api.nvim_buf_get_lines(file_buf, 0, -1, false)
  -- Open a vertical new scratch buffer
  vim.cmd("vnew")
  local scratch_buf = vim.api.nvim_get_current_buf()
  -- Set the scratch buffer options: nofile, wipe when hidden, and no swapfile.
  vim.bo[scratch_buf].buftype = "nofile"
  vim.bo[scratch_buf].bufhidden = "wipe"
  vim.bo[scratch_buf].swapfile = false
  -- Insert the lines into the scratch buffer. They remain as a list, preserving the original line breaks.
  vim.api.nvim_buf_set_lines(scratch_buf, 0, -1, false, file_lines)
  -- Enable diff mode in the scratch buffer
  vim.cmd("diffthis")
  -- Go back to the previous window (the current file with its undo state) and enable diff mode there too.
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
end
