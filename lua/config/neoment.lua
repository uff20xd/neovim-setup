vim.g.neoment = {
	-- Save session data to disk (default: true)
	save_session = true,
	
	-- Custom notifier function (optional)
	-- By default, uses vim.notify
	notifier = function(msg, level, opts)
		vim.notify(msg, level, opts)
	end,
	
	-- Desktop notifications can be configured per room type.
	-- The buffer setting applies to currently open rooms (excluding the focused room),
	-- while favorites, people, and rooms settings apply to all rooms of those types.
	desktop_notifications = {
		enabled = true,  -- Enable or disable desktop notifications (default: true)
		
		-- Notification levels for different room types
		-- Options: "all", "mentions", "none"
		-- "all" - notify for all new messages
		-- "mentions" - notify only for mentions/highlights
		-- "none" - do not notify
		buffer = "all", -- When buffer is set to "none", it'll inherit the room setting from its type
		favorites = "all",
		people = "all",
		rooms = "mentions",
		
		-- You can also set notification levels per room ID or alias by using a table:
		per_room = {
			-- ["!roomid:matrix.org"] = "all",
			-- ["#a_room_alias:matrix.org"] = "mentions",
		},
	},
	
	-- Picker configuration (optional)
	-- Customize the UI for room selection (default: vim.ui.select)
	picker = {
		-- Custom picker for `:Neoment rooms` command and other room selections
		-- Receives items (list of {room, line}), a callback function and options
		-- room is the room object, line is the formatted string to display
		-- The callback must be called with the selected room in order to open it
		-- options is a table with one `prompt` field containing the prompt string
		rooms = function(items, callback, options)
			vim.ui.select(items, {
				prompt = options.prompt,
				format_item = function(item) return item.line end,
			}, function(choice)
				if choice then callback(choice.room) end
			end)
		end,
		-- Custom picker for `:Neoment open_rooms` command
		-- Same signature as rooms picker
		open_rooms = function(items, callback, options)
			vim.ui.select(items, {
				prompt = options.prompt,
				format_item = function(item) return item.line end,
			},
        function(choice)
          if choice then callback(choice.room) end
        end
      )
		end,
	},
	-- Settings for the room list
	rooms = {
		-- How to display the last message. The last message is shown below the room name
		-- Options:
		-- "no" - do not show the last message
		-- "message" - show the last message content
		-- "sender_message" - show the sender and last message content, each one on its own line
		-- "sender_message_inline" - show the sender and last message content on the same line.
		display_last_message = "message",
	},
}
