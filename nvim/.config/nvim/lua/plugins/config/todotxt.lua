return {
    "arnarg/todotxt.nvim",
    requires = { "MunifTanjim/nui.nvim" },
    cmd = {
        "ToDoTxtCapture",
        "ToDoTxtTasksToggle",
        "ToDoTxtTasksOpen",
        "ToDoTxtTasksClose",
    },
    config = function()
        require("todotxt-nvim").setup({
            todo_file = os.getenv("TODO_FILE"),
            keymap = {
                delete_task = "d",
                complete_task = "<C-Space>",
                edit_task = "e",
            },
        })
    end,
}
