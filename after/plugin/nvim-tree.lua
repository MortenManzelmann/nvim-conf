require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})

local tree_actions = {
	{
		name = "Create node",
		handler = require("nvim-tree.api").fs.create,
	},
	{
		name = "Remove node",
		handler = require("nvim-tree.api").fs.remove,
	},
	{
		name = "Trash node",
		handler = require("nvim-tree.api").fs.trash,
	},
	{
		name = "Rename node",
		handler = require("nvim-tree.api").fs.rename,
	},
	{
		name = "Fully rename node",
		handler = require("nvim-tree.api").fs.rename_sub,
	},
	{
		name = "Copy",
		handler = require("nvim-tree.api").fs.copy.node,
	},

	-- ... other custom actions you may want to display in the menu
}

local function tree_actions_menu(node)
	local entry_maker = function(menu_item)
		return {
			value = menu_item,
			ordinal = menu_item.name,
			display = menu_item.name,
		}
	end

	local finder = require("telescope.finders").new_table({
		results = tree_actions,
		entry_maker = entry_maker,
	})

	local sorter = require("telescope.sorters").get_generic_fuzzy_sorter()

	local default_options = {
		finder = finder,
		sorter = sorter,
		attach_mappings = function(prompt_buffer_number)
			local actions = require("telescope.actions")

			-- On item select
			actions.select_default:replace(function()
				local state = require("telescope.actions.state")
				local selection = state.get_selected_entry()
				-- Closing the picker
				actions.close(prompt_buffer_number)
				-- Executing the callback
				selection.value.handler(node)
			end)

			-- The following actions are disabled in this example
			-- You may want to map them too depending on your needs though
			actions.add_selection:replace(function() end)
			actions.remove_selection:replace(function() end)
			actions.toggle_selection:replace(function() end)
			actions.select_all:replace(function() end)
			actions.drop_all:replace(function() end)
			actions.toggle_all:replace(function() end)

			return true
		end,
	}

	-- Opening the menu
	require("telescope.pickers").new({ prompt_title = "Tree menu" }, default_options):find()
end

vim.keymap.set("n", "<M-Space>", tree_actions_menu, { buffer = buffer, noremap = true, silent = true })
