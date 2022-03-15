return {
    "pwntester/octo.nvim",
    requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
    },
    cmd = "Octo",
    config = function()
        require("octo").setup({
            mappings = {
                issue = {
                    close_issue = ",ic", -- close issue
                    reopen_issue = ",io", -- reopen issue
                    list_issues = ",il", -- list open issues on same repo
                    reload = "<C-r>", -- reload issue
                    open_in_browser = "<C-b>", -- open issue in browser
                    copy_url = "<C-y>", -- copy url to system clipboard
                    add_assignee = ",aa", -- add assignee
                    remove_assignee = ",ad", -- remove assignee
                    create_label = ",lc", -- create label
                    add_label = ",la", -- add label
                    remove_label = ",ld", -- remove label
                    goto_issue = ",gi", -- navigate to a local repo issue
                    add_comment = ",ca", -- add comment
                    delete_comment = ",cd", -- delete comment
                    next_comment = "]c", -- go to next comment
                    prev_comment = "[c", -- go to previous comment
                    react_hooray = ",rp", -- add/remove 🎉 reaction
                    react_heart = ",rh", -- add/remove ❤️ reaction
                    react_eyes = ",re", -- add/remove 👀 reaction
                    react_thumbs_up = ",r+", -- add/remove 👍 reaction
                    react_thumbs_down = ",r-", -- add/remove 👎 reaction
                    react_rocket = ",rr", -- add/remove 🚀 reaction
                    react_laugh = ",rl", -- add/remove 😄 reaction
                    react_confused = ",rc", -- add/remove 😕 reaction
                },
                pull_request = {
                    checkout_pr = ",po", -- checkout PR
                    merge_pr = ",pm", -- merge PR
                    list_commits = ",pc", -- list PR commits
                    list_changed_files = ",pf", -- list PR changed files
                    show_pr_diff = ",pd", -- show PR diff
                    add_reviewer = ",va", -- add reviewer
                    remove_reviewer = ",vd", -- remove reviewer request
                    close_issue = ",ic", -- close PR
                    reopen_issue = ",io", -- reopen PR
                    list_issues = ",il", -- list open issues on same repo
                    reload = "<C-r>", -- reload PR
                    open_in_browser = "<C-b>", -- open PR in browser
                    copy_url = "<C-y>", -- copy url to system clipboard
                    add_assignee = ",aa", -- add assignee
                    remove_assignee = ",ad", -- remove assignee
                    create_label = ",lc", -- create label
                    add_label = ",la", -- add label
                    remove_label = ",ld", -- remove label
                    goto_issue = ",gi", -- navigate to a local repo issue
                    add_comment = ",ca", -- add comment
                    delete_comment = ",cd", -- delete comment
                    next_comment = "]c", -- go to next comment
                    prev_comment = "[c", -- go to previous comment
                    react_hooray = ",rp", -- add/remove 🎉 reaction
                    react_heart = ",rh", -- add/remove ❤️ reaction
                    react_eyes = ",re", -- add/remove 👀 reaction
                    react_thumbs_up = ",r+", -- add/remove 👍 reaction
                    react_thumbs_down = ",r-", -- add/remove 👎 reaction
                    react_rocket = ",rr", -- add/remove 🚀 reaction
                    react_laugh = ",rl", -- add/remove 😄 reaction
                    react_confused = ",rc", -- add/remove 😕 reaction
                },
                review_thread = {
                    goto_issue = ",gi", -- navigate to a local repo issue
                    add_comment = ",ca", -- add comment
                    add_suggestion = ",sa", -- add suggestion
                    delete_comment = ",cd", -- delete comment
                    next_comment = "]c", -- go to next comment
                    prev_comment = "[c", -- go to previous comment
                    select_next_entry = "]q", -- move to previous changed file
                    select_prev_entry = "[q", -- move to next changed file
                    close_review_tab = "<C-c>", -- close review tab
                    react_hooray = ",rp", -- add/remove 🎉 reaction
                    react_heart = ",rh", -- add/remove ❤️ reaction
                    react_eyes = ",re", -- add/remove 👀 reaction
                    react_thumbs_up = ",r+", -- add/remove 👍 reaction
                    react_thumbs_down = ",r-", -- add/remove 👎 reaction
                    react_rocket = ",rr", -- add/remove 🚀 reaction
                    react_laugh = ",rl", -- add/remove 😄 reaction
                    react_confused = ",rc", -- add/remove 😕 reaction
                },
                submit_win = {
                    approve_review = "<C-a>", -- approve review
                    comment_review = "<C-m>", -- comment review
                    request_changes = "<C-r>", -- request changes review
                    close_review_tab = "<C-c>", -- close review tab
                },
                review_diff = {
                    add_review_comment = ",ca", -- add a new review comment
                    add_review_suggestion = ",sa", -- add a new review suggestion
                    focus_files = ",e", -- move focus to changed file panel
                    toggle_files = ",b", -- hide/show changed files panel
                    next_thread = "]t", -- move to next thread
                    prev_thread = "[t", -- move to previous thread
                    select_next_entry = "]q", -- move to previous changed file
                    select_prev_entry = "[q", -- move to next changed file
                    close_review_tab = "<C-c>", -- close review tab
                    toggle_viewed = ",,", -- toggle viewer viewed state
                },
                file_panel = {
                    next_entry = "j", -- move to next changed file
                    prev_entry = "k", -- move to previous changed file
                    select_entry = "<cr>", -- show selected changed file diffs
                    refresh_files = "R", -- refresh changed files panel
                    focus_files = ",e", -- move focus to changed file panel
                    toggle_files = ",b", -- hide/show changed files panel
                    select_next_entry = "]q", -- move to previous changed file
                    select_prev_entry = "[q", -- move to next changed file
                    close_review_tab = "<C-c>", -- close review tab
                    toggle_viewed = ",,", -- toggle viewer viewed state
                },
            },
        })

        require("which-key").register({
            [","] = "toggle-viewed",
            b = "toggle-files",
            e = "focus-files",
            a = {
                name = "+assignee",
                a = "add",
                d = "delete",
            },
            c = {
                name = "+comment",
                a = "add",
                d = "delete",
            },
            i = {
                name = "+issue",
                c = "close",
                o = "open",
                l = "list",
            },
            g = {
                name = "+go",
                i = "issue",
            },
            l = {
                name = "+label",
                c = "create",
                a = "add",
                d = "delete",
            },
            p = {
                name = "+pr",
                o = "checkout",
                c = "commits-list",
                f = "files-changed",
                d = "diff",
            },
            r = {
                name = "+react",
                ["+"] = "thumbs-up",
                ["-"] = "thumbs-down",
                c = "confused",
                e = "eyes",
                h = "heart",
                l = "laugh",
                p = "hooray",
                r = "rocket",
            },
            s = {
                name = "+suggestion",
                a = "add",
            },
            v = {
                name = "+reviewer",
                a = "add",
                d = "delete",
            },
        }, {
            prefix = ",",
            mode = "n",
            silent = true,
            noremap = true,
        })
    end,
}
