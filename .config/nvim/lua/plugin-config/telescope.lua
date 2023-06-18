local actions = require "telescope.actions"

require('telescope.').setup {
    defaults = {
        preview = false,

        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-s>"] = actions.select_horizontal,
            },
        }
    }
}
