return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({
            layout = {
                align = "center",
            },
            operators = { gc = "Comments", gb = "Block Comments" },
        })

        -- Space keymaps
        local leader_keymaps = {
            [" "] = { ":w<CR>", "write" },
            ["-"] = { "<C-w>s", "split-below" },
            ["."] = { "<CMD>BWipeout other<CR>", "only-buffer" },
            [","] = { "<CMD>BWipeout hidden<CR>", "hidden-buffers" },
            ["/"] = { "comment" },
            ["\\"] = { "<C-w>v", "split-right" },
            c = { "<CMD>Cheat<CR>", "cheat" },
            d = { "<CMD>Bwipeout<CR>", "delete-buffer" },
            e = { "<CMD>NvimTreeFindFileToggle<CR>", "explorer" },
            f = { "<CMD>lua vim.lsp.buf.formatting_seq_sync()<CR>", "format" },
            j = { "<CMD>ToggleGitStatus<CR>", "git-status" },
            k = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "code-actions" },
            n = { ":nohl<CR>", "no-highlight" },
            o = "organize-imports",
            q = { "<CMD>CodeActionMenu<CR>", "quickfix" },
            u = { "<CMD>MundoToggle<CR>", "undotree" },
            x = { "<CMD>BWipeout all<CR>", "delete-all-buffers" },
            z = { "<CMD>ZenMode<CR>", "zenmode" },
        }

        local leader_visual_keymaps = {
            ["/"] = { "comment" },
            f = { "<CMD>lua vim.lsp.buf.range_formatting()<CR>", "format" },
            k = { "<CMD>lua vim.lsp.buf.range_code_action()<CR>", "code-actions" },
            q = { "<CMD>CodeActionMenu<CR>", "quickfix" },
            x = { "<Plug>(vsnip-select-text)", "snippet-select" },
            X = { "<Plug>(vsnip-cut-text)", "snippet-cut" },
        }

        leader_keymaps["1"] = "which_key_ignore"
        leader_keymaps["2"] = "which_key_ignore"
        leader_keymaps["3"] = "which_key_ignore"
        leader_keymaps["4"] = "which_key_ignore"
        leader_keymaps["5"] = "which_key_ignore"
        leader_keymaps["6"] = "which_key_ignore"
        leader_keymaps["7"] = "which_key_ignore"
        leader_keymaps["8"] = "which_key_ignore"
        leader_keymaps["9"] = "which_key_ignore"
        leader_keymaps["0"] = "which_key_ignore"

        leader_keymaps["a"] = {
            name = "+actions",
            a = { "<Plug>(EasyAlign)", "align" },
            d = { "<CMD>lua require('neogen').generate()<CR>", "doc-gen" },
            e = { ":!chmod +x %<CR>", "executable" },
            j = { "<CMD>SplitjoinJoin<CR>", "join-lines" },
            r = { "rename" },
            p = { 'ggVG"+p', "paste-file" },
            s = { "<CMD>ISwap<CR>", "swap" },
            x = { "<CMD>SplitjoinSplit<CR>", "split-lines" },
            y = { "<CMD>%y+<CR>", "yank-file" },
        }

        leader_visual_keymaps["a"] = {
            name = "+actions",
            a = { "<Plug>(EasyAlign)", "align" },
            s = { ":Sort i<CR>", "sort" },
        }

        leader_keymaps["g"] = {
            name = "+git",
            b = { "<CMD>lua require('telescope.builtin').git_branches()<CR>", "branches" },
            c = { "<CMD>lua require('telescope.builtin').git_commits()<CR>", "commits" },
            d = { "<CMD>DiffviewOpen<CR>", "diffview" },
            f = {
                "<CMD>lua require('gitlinker').get_buf_range_url('n', { add_current_line_on_normal_mode = false })<CR>",
                "file-link",
            },
            F = {
                "<CMD>lua require('gitlinker').get_buf_range_url('n', { add_current_line_on_normal_mode = false, action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                "file-browser",
            },
            h = { "<CMD>DiffviewFileHistory %<CR>", "history-file" },
            i = { "<CMD>Octo issue list<CR>", "gh-issues" },
            l = { "<CMD>lua require('gitlinker').get_buf_range_url('n', {})<CR>", "line-link" },
            L = {
                "<CMD>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                "line-browser",
            },
            p = { "<CMD>Octo pr list<CR>", "gh-pr" },
            s = { "<CMD>lua require('telescope.builtin').git_stashes()<CR>", "stashes" },
            t = { "<CMD>Gitsigns toggle_current_line_blame<CR>", "toggle-blame" },
            u = { "<CMD>lua require('gitlinker').get_repo_url()<CR>", "url-link" },
            U = {
                "<CMD>lua require('gitlinker').get_repo_url({ action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                "url-browser",
            },
        }

        leader_visual_keymaps["g"] = {
            name = "+git",
            l = { "<CMD>lua require('gitlinker').get_buf_range_url('v', {})<CR>", "line-link" },
            L = {
                "<CMD>lua require('gitlinker').get_buf_range_url('v', { action_callback = require('gitlinker.actions').open_in_browser })<CR>",
                "line-browser",
            },
        }

        leader_keymaps["h"] = {
            name = "+hunks",
            b = "blame-line",
            D = "diff-file",
            d = "diff-this",
            p = "preview-hunk",
            R = "reset-buffer",
            r = "reset-hunk",
            S = "stage-buffer",
            s = "stage-hunk",
            u = "undo-stage-hunk",
        }

        leader_visual_keymaps["h"] = {
            name = "+hunks",
            r = "reset-hunk",
            s = "stage-hunk",
        }

        leader_keymaps["m"] = {
            name = "+marks",
            a = { "<CMD>MarksListAll<CR>", "all-list" },
            b = { "<CMD>BookmarksListAll<CR>", "bookmarks-list" },
            g = { "<CMD>MarksListGlobal<CR>", "global-list" },
            l = { "<CMD>MarksListBuf<CR>", "local-list" },
            t = { "<CMD>MarksToggleSigns<CR>", "toggle-signs" },
        }

        leader_keymaps["p"] = {
            name = "+package-info",
            c = { "<CMD>lua require('package-info').change_version()<CR>", "change-version" },
            d = { "<CMD>lua require('package-info').delete()<CR>", "delete" },
            h = { "<CMD>lua require('package-info').hide()<CR>", "hide" },
            i = { "<CMD>lua require('package-info').install()<CR>", "install" },
            r = { "<CMD>lua require('package-info').reinstall()<CR>", "reinstall" },
            s = { "<CMD>lua require('package-info').show()<CR>", "show" },
            u = { "<CMD>lua require('package-info').update()<CR>", "update" },
        }

        leader_keymaps["r"] = {
            name = "+refactoring",
            c = { "<CMD>lua require('refactoring').debug.cleanup({})<CR>", "cleanup" },
            p = { "<CMD>lua require('refactoring').debug.printf({})<CR>", "print" },
        }

        leader_visual_keymaps["r"] = {
            name = "+refactoring",
            e = { "<ESC><CMD>lua require('refactoring').refactor('Extract Function')<CR>", "extract-function" },
            f = {
                "<ESC><CMD>lua require('refactoring').refactor('Extract Function To File')<CR>",
                "extract-function-to-file",
            },
            i = { "<ESC><CMD>lua require('refactoring').refactor('Inline Variable')<CR>", "inline-variable" },
            p = { "<CMD>lua require('refactoring').debug.print_var({})<CR>", "print-var" },
            r = { "<ESC><CMD>lua require('telescope').extensions.refactoring.refactors()<CR>", "refactors" },
            v = { "<ESC><CMD>lua require('refactoring').refactor('Extract Variable')<CR>", "extract-variable" },
        }

        leader_keymaps["t"] = {
            name = "+tests",
            a = { "<CMD>UltestAttach<CR>", "attach" },
            c = { "<CMD>UltestClear<CR>", "clear" },
            d = { "<CMD>UltestDebug<CR>", "debug" },
            l = { "<CMD>UltestLast<CR>", "last" },
            n = { "<CMD>UltestNearest<CR>", "nearest" },
            o = { "<CMD>UltestOutput<CR>", "output" },
            r = { "<CMD>Ultest<CR>", "run" },
            s = { "<CMD>UltestStop<CR>", "stop" },
            t = { "<CMD>UltestSummary<CR>", "toggle" },
        }

        leader_keymaps["w"] = { name = "+wiki" }

        local register = require("which-key").register
        register(leader_keymaps, {
            prefix = "<Leader>",
            mode = "n",
            silent = true,
            noremap = true,
        })

        register(leader_visual_keymaps, {
            prefix = "<Leader>",
            mode = "x",
            silent = true,
            noremap = true,
        })

        -- Semicolon keymaps
        local semicolon_keymaps = {
            [";"] = { "<CMD>Telescope find_files hidden=true<CR>", "find-files" },
            b = { "<CMD>Telescope buffers<CR>", "buffers" },
            c = { "<CMD>CheatList<CR>", "cheat-list" },
            d = { "<CMD>DBUIToggle<CR>", "db" },
            e = { "<CMD>Telescope file_browser hidden=true<CR>", "telescope-explorer" },
            f = { "<CMD>Telescope find_files find_command=fd,-HIL<CR>", "find-files-all" },
            g = { "<CMD>ToggleNeogitStatus<CR>", "git-status" },
            l = { "<CMD>LLToggle<CR>", "loc-list-toggle" },
            m = { "<Plug>MarkdownPreviewToggle", "markdown-preview" },
            o = { "<CMD>SymbolsOutline<CR>", "symbols-outline" },
            p = { "<CMD>lua require('telescope').extensions.project.project({})<CR>", "project" },
            q = { "<CMD>QFToggle<CR>", "qf-list-toggle" },
            r = { "<ESC><CMD>lua require('telescope').extensions.refactoring.refactors()<CR>", "refactor" },
            s = { "<CMD>Telescope live_grep<CR>", "search-text" },
            w = {
                "<CMD>lua require('telescope.builtin').find_files({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
                "find-wiki",
            },
            W = {
                "<CMD>lua require('telescope.builtin').live_grep({search_dirs = {os.getenv('VIMWIKI_PATH')}})<CR>",
                "search-wiki",
            },
            z = { "<CMD>lua require('telescope').extensions.zoxide.list({})<CR>", "zoxide" },
        }

        local semicolon_visual_keymaps = {
            r = { "<ESC><CMD>lua require('telescope').extensions.refactoring.refactors()<CR>", "refactor" },
        }

        register(semicolon_keymaps, {
            prefix = ";",
            mode = "n",
            silent = true,
            noremap = true,
        })

        register(semicolon_visual_keymaps, {
            prefix = ";",
            mode = "x",
            silent = true,
            noremap = true,
        })

        -- Comma keymaps
        local comma_keymaps = {
            c = {
                "<CMD>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<CR>",
                "code-actions",
            },
            d = {
                "<CMD>lua require('telescope.builtin').lsp_definitions({ jump_type = 'never' })<CR>",
                "definitions",
            },
            e = {
                name = "+errors",
                d = { "<CMD>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", "document" },
                w = { "<CMD>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", "workspace" },
            },
            i = {
                "<CMD>lua require('telescope.builtin').lsp_implementations({ jump_type = 'never' })<CR>",
                "implementations",
            },
            l = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "loclist-diagnostics" },
            q = { "<CMD>lua vim.diagnostic.setqflist()<CR>", "qflist-diagnostics" },
            r = { "<CMD>lua require('telescope.builtin').lsp_references()<CR>", "references" },
            s = {
                name = "+symbols",
                d = { "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>", "documents" },
                w = { "<CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "workspace" },
                W = {
                    "<CMD>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
                    "dynamic-workspace",
                },
            },
            t = {
                "<CMD>lua require('telescope.builtin').lsp_type_definitions({ jump_type = 'never' })<CR>",
                "type-definitions",
            },
            T = { "<CMD>lua require('null-ls').toggle('spell')<CR>", "toggle-cspell" },
        }

        local comma_visual_keymaps = {
            c = {
                "<CMD>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())",
                "code-actions",
            },
        }

        register(comma_keymaps, {
            prefix = ",",
            mode = "n",
            silent = true,
            noremap = true,
        })

        register(comma_visual_keymaps, {
            prefix = ",",
            mode = "x",
            silent = true,
            noremap = true,
        })
    end,
}