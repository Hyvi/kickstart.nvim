-- NOTE: Only enable either copilot-vim or codeium-vim at the same time
return {
  -- Setup copilot.vim
  'github/copilot.vim',
  event = 'VeryLazy',
  config = function()
    -- For copilot.vim
    -- enable copilot for specific filetypes
    vim.g.copilot_filetypes = {
      '*',
    }

    -- Set to true to assume that copilot is already mapped
    -- vim.g.copilot_assume_mapped = true
    -- Set workspace folders
    vim.g.copilot_workspace_folders = '~/Projects'

    -- Setup keymaps
    local keymap = vim.keymap.set
    local opts = { silent = true }

    -- Set <C-y> to accept copilot suggestion
    keymap('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

    -- Set <C-i> to accept line
    keymap('i', '<C-i>', '<Plug>(copilot-accept-line)', opts)

    -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
    keymap('i', '<C-j>', '<Plug>(copilot-next)', opts)
    keymap('i', '<C-k>', '<Plug>(copilot-previous)', opts)
    keymap('i', '<C-l>', '<Plug>(copilot-suggest)', opts)

    -- Set <C-d> to dismiss suggestion
    keymap('i', '<C-d>', '<Plug>(copilot-dismiss)', opts)
  end,
}
