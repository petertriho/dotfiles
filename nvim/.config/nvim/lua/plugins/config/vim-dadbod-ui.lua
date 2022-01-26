return {
    "kristijanhusak/vim-dadbod-ui",
    requires = "tpope/vim-dadbod",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
    setup = function()
        vim.g.db_ui_show_database_icon = 1
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
