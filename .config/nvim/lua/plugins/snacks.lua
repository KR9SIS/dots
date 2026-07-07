return {
    "folke/snacks.nvim",
    opts = {
        scroll = { enabled = false }, -- Disable scrolling animations
        picker = {
            sources = {
                files = { hidden = true },
                grep = { hidden = true },
                explorer = { hidden = true },
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        local git = require("snacks.git")
        local orig_get_root = git.get_root
        git.get_root = function(path)
            local root = orig_get_root(path)
            if root and not (vim.uv or vim.loop).fs_stat(root .. "/.git") then
                return nil
            end
            return root
        end
    end,
}
