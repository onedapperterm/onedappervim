local loader = require("onedapperterm.utils.loader")

return {
	"nvim-telescope/telescope.nvim", 
	tag = "0.1.8",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "ThePrimeagen/harpoon", branch="harpoon2" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},

	config = function()
		local telescope = loader.load("telescope")

		-- IMPORT TELESCOPE ACTIONS FOR KEYMAPS
		local actions = require("telescope.actions")

		-- TELESCOPE CONFIGS
		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = "❯ ",
				path_display = { "truncate" },
				file_ignore_patterns = {
					"node_modules", 
					".git" ,
					".venv", 
					"__pycache__", 
					".cache", 
					".vscode", 
					".idea", 
					".DS_Store", 
					".gitignore", 
					".gitmodules",
					".gitattributes",
					".gitlab-ci.yml",
					".gitkeep",
					".gitlab",
					".github"
				},
				layout_config = {
					vertical = { width = 0.9 },
					horizontal = { width = 0.9 }
				},
				path_display = {
					"smart",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
					},
					n = {
						["q"] = actions.close,
						["<CR>"] = actions.select_default,
						["h"] = actions.select_horizontal,
						["v"] = actions.select_vertical,
					},
				}
			},
			pickers = {
				find_files = {
                    layout_strategy = "horizontal",
				},
				live_grep = {
					theme = "dropdown",
				},
				buffers = {
                    layout_strategy = "horizontal",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				}
			},
		})

		-- LOAD EXTENSIONS
		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		telescope.load_extension("file_browser")

        -- GLOBAL KEYMAPS
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files", noremap = true })   --Find files
        vim.keymap.set("v", "<C-p>", builtin.find_files, { desc = "Find files", noremap = true })   --Find files (while visual mode)
        vim.keymap.set("n", "<leader>lo", builtin.git_bcommits, { desc = "Git buffer commits" })    --File git commits

        vim.keymap.set("n", "<leader>ll", function()                                                --Live grep fzf
            builtin.live_grep({ layout_strategy = "bottom_pane" })
        end, { desc = "Live Grep (bottom pane)" })

        vim.keymap.set("n", "<leader>r", function()                                                 --Lsp References
            builtin.lsp_references({ layout_strategy = "bottom_pane" })
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "LSP References (bottom pane)" })

        vim.keymap.set("n", "<leader>d", function()                                                 --Lsp Definitions
            builtin.lsp_definitions({ layout_strategy = "bottom_pane" })
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "LSP Definitions (bottom pane)" })

        vim.keymap.set("n", "<leader>h", function()                                                 --Harpoon marks
            telescope.extensions.harpoon.marks({ layout_strategy = "vertical" })
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "Show harpoon marks" })

        vim.keymap.set("n", "<leader>fb", function()                                                --Buffer list
            builtin.buffers()
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "Find buffers" })

        vim.keymap.set("n", "<leader>fo", function()                                                --Recent files
            builtin.oldfiles()
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "Find recent files" })

        vim.keymap.set("n", "<leader>ww", function()                                                --Find word
            builtin.grep_string({ layout_strategy = "bottom_pane" })
            vim.schedule(function() vim.cmd("stopinsert") end)
        end, { desc = "Find word" })

	end
}
