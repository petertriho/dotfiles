return {
    "vimwiki/vimwiki",
    keys = "<Leader>w",
    setup = function()
        vim.g.vimwiki_list = {
            { path = os.getenv("VIMWIKI_PATH"), syntax = "markdown", ext = ".md" },
        }
        vim.g.vimwiki_conceallevel = 0
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_key_mappings = { table_mappings = 0, links = 0, mouse = 0 }
    end,
}
