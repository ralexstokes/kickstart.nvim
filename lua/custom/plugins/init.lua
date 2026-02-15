-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', '<cmd>Git<CR>', desc = '[G]it [S]tatus' },
      { '<leader>gd', '<cmd>Gvdiffsplit<CR>', desc = '[G]it [D]iff split' },
      { '<leader>gb', '<cmd>Git blame<CR>', desc = '[G]it [B]lame' },
      { '<leader>gl', '<cmd>Git log --oneline --decorate --graph<CR>', desc = '[G]it [L]og' },
      { '<leader>gp', '<cmd>Git push<CR>', desc = '[G]it [P]ush' },
      { '<leader>gP', '<cmd>Git pull<CR>', desc = '[G]it [P]ull' },
      { '<leader>gw', '<cmd>Gwrite<CR>', desc = '[G]it [W]rite (stage file)' },
      { '<leader>gr', '<cmd>Gread<CR>', desc = '[G]it [R]ead (checkout file)' },
      { '<leader>gc', '<cmd>Git commit<CR>', desc = '[G]it [C]ommit' },
    },
  },
}
