return {
    "folke/snacks.nvim",
    -- opts = {
    --     scroll = { enabled = false }, -- Disable scrolling animations
    --     -- picker = { sources = { files = { hidden = true } } },
    --     -- explorer = { hidden = true },
    --     explorer = {
    --         sources = {
    --             files = {
    --                 hidden = true,
    --             },
    --         },
    --     },
    -- },
    opts = {
        picker = {
            sources = {
                files = { hidden = true },
                grep = { hidden = true },
                explorer = { hidden = true },
            },
        },
    },
}
