return {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    config = function()
        require("todo-comments").setup()
    end,
}
