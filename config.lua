-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


local function open_nvim_tree()
require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<CR>a"

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

lvim.plugins = {
  {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup()
  end,
  },
  {
  "ethanholz/nvim-lastplace",
  event = "BufRead",
  config = function()
   require("nvim-lastplace").setup({
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = {
     "gitcommit", "gitrebase", "svn", "hgcommit",
    },
    lastplace_open_folds = true,
   })
  end,
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
