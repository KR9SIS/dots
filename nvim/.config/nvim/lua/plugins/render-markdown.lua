return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},

  vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { link = 'DiffAdd' }),
  vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { link = 'DiffAdd' }),
  vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { link = 'DiffAdd' }),
  vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { link = 'DiffAdd' }),
  vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { link = 'DiffAdd' }),
  vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { link = 'DiffAdd' }),

  config = function()
    require('render-markdown').setup {
      completions = { lsp = { enabled = true } },
      latex = { { enabled = false } }, -- Remove to add latex rendering
      heading = {
        enabled = true,
        render_modes = false,
        sign = true,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        position = 'overlay',
        signs = { '󰫎 ' },
        width = 'full',
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = '▄',
        below = '▀',
        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
        foregrounds = {
          'RenderMarkdownH1',
          'RenderMarkdownH2',
          'RenderMarkdownH3',
          'RenderMarkdownH4',
          'RenderMarkdownH5',
          'RenderMarkdownH6',
        },
        custom = {},
      },
    }
  end,
}
