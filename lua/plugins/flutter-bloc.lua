return {
  "wa11breaker/flutter-bloc.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim", -- Required for code actions
  },
  opts = {
    bloc_type = "default", -- Choose from: 'default', 'equatable', 'freezed'
    use_sealed_classes = false,
    enable_code_actions = true,
  },
  event = "VeryLazy",
  keys = {
    { "<leader>bb", "<cmd>FlutterCreateBloc<CR>", desc = "Generate Bloc" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Show Code Actions" },
  },
}
