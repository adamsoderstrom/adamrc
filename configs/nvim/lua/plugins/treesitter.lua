-- in your user config: ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- make sure textobjects is there
    opts.textobjects = opts.textobjects or {}
    opts.textobjects.select = vim.tbl_deep_extend("force", opts.textobjects.select or {}, {
      enable = true,
      lookahead = true,
      keymaps = {
        -- calls
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
      },
    })
    return opts
  end,
}
