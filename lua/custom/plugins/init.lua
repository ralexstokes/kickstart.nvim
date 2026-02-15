-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = {
      {
        '<leader>gg',
        function() require('neogit').open() end,
        desc = 'Open Neo[g]it',
      },
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
}
