return {
    "mg979/vim-visual-multi",
    setup = function()
        vim.g.VM_leader = "\\"
        vim.g.VM_maps = { ["Find Under"] = "\\f", ["Find Subword Under"] = "\\f" }
        vim.g.VM_mouse_mappings = 1
        vim.g.VM_Mono_hl = "DiffText"
        vim.g.VM_Extend_hl = "DiffAdd"
        vim.g.VM_Cursor_hl = "Visual"
        vim.g.VM_Insert_hl = "DiffChange"

        local config
        local lens_backup

        local function override_lens(render, plist, nearest, idx, r_idx)
            local _ = r_idx
            local lnum, col = unpack(plist[idx])

            local text, chunks
            if nearest then
                text = ("[%d/%d]"):format(idx, #plist)
                chunks = { { " ", "Ignore" }, { text, "VM_Extend" } }
            else
                text = ("[%d]"):format(idx)
                chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
            end
            render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
        end

        local function vm_lens_start()
            local hlslens = require("hlslens")
            if hlslens then
                config = require("hlslens.config")
                lens_backup = config.override_lens
                config.override_lens = override_lens
                hlslens.start()
            end
        end

        local function vm_lens_exit()
            local hlslens = require("hlslens")
            if hlslens then
                config.override_lens = lens_backup
                hlslens.start()
            end
        end

        vim.api.nvim_create_augroup("vmlens", {})
        vim.api.nvim_create_autocmd("User", {
            group = "vmlens",
            pattern = "visual_multi_start",
            callback = vm_lens_start,
            desc = "Visual multi lens start callback",
        })

        vim.api.nvim_create_autocmd("User", {
            group = "vmlens",
            pattern = "visual_multi_exit",
            callback = vm_lens_exit,
            desc = "Visual multi lens exit callback",
        })
    end,
}
