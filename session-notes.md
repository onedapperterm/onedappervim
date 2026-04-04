# Change Report — 2026-03-30

## `lazy-lock.json` — Plugin Updates
Batch update of plugin lockfile commits. Notable additions:
- **New plugins locked**: `nvim-dap`, `nvim-dap-python`, `nvim-dap-ui`, `nvim-dap-virtual-text`, `nvim-nio`, `nvim-lspconfig` — all DAP (debugger) related, indicating a new debugger setup is being added.

---

## `keymap.lua` — DAP Keybindings Added
New keymaps under `<leader>d*` for debugger control:
- `<leader>dc` — continue
- `<leader>db` — toggle breakpoint
- `<leader>l` — step over
- `<leader>di` — step into
- `<leader>do` — step out

---

## `lsp-handlers-config.lua` — LSP Diagnostic Sign Modernization
- Replaced the old `vim.fn.sign_define` loop with the newer `vim.diagnostic.severity`-based sign table format (Neovim 0.10+ API).
- **Removed**: the poetry `pythonPath` auto-detection block and the `foldingRangeProvider` override from `on_attach`.

---

## `lsp-config.lua` — Cleanup
- Removed the `print("LSP attached: " .. client.name)` debug log.

---

## `harpoon.lua` — Nil Guard Added
- Added an early `return` if `harpoon` fails to load, preventing errors on missing plugin.

---

## `ufo-fold.lua` — Fold Provider Configured
- Explicitly set `provider_selector` to use `{ "treesitter", "indent" }` instead of the default. Minor string quoting style cleanup.

---

## `spell/en.utf-8.add` — New Words
Added: `IDA3`, `Dropdown`, `memoize`, `middleware`, `redux`, `Args`, `str`, `repo`, `DataFrame`.

---

## `lua/onedapperterm/plugins/debugger.lua` — New Untracked File
A new debugger plugin config file exists but hasn't been staged yet.
