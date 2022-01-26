return {
    "kazhala/close-buffers.nvim",
    cmd = { "BDelete", "BWipeout" },
    config = function()
        require("close_buffers").setup()
    end,
}
