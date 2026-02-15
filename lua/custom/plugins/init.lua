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
        '<leader>gs',
        function() require('neogit').open() end,
        desc = 'Open Neo[g]it',
      },
    },
    opts = {
      integrations = {
        diffview = true,
      },
      mappings = {
        status = {
          ['s'] = function()
            local status = require('neogit.buffers.status').instance()
            if not status or not status.buffer or not status.buffer.ui then
              return
            end

            local ui = status.buffer.ui
            local selection = ui:get_selection()
            local section = ui:get_current_section() or selection.section
            local item = selection.item

            -- Work around cursor-to-hunk detection misses by resolving hunks from line range.
            if section and section.options.section == 'unstaged' and item then
              local hunks = ui:item_hunks(item, selection.first_line, selection.last_line, false)
              if #hunks > 0 then
                local git = require 'neogit.lib.git'
                local patch = git.index.generate_patch(hunks[1].hunk)
                git.index.apply(patch, { cached = true })
                status:dispatch_refresh({ update_diffs = { '*:' .. item.name } }, 'user_n_stage_hunk')
                return
              end
            end

            require('neogit.buffers.status.actions').n_stage(status)()
          end,
        },
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<cmd>Neotree<CR>', desc = 'File Tr[e]e' },
      { '\\', '<cmd>Neotree reveal<CR>', desc = 'NeoTree reveal' },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['<tab>'] = 'toggle_node',
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
  {
    's1n7ax/nvim-window-picker',
    version = '2.*',
    opts = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
          buftype = { 'terminal', 'quickfix' },
        },
      },
    },
  },
}
