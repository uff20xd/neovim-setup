local palette = require('yugener.palette')

local yugener = {}

yugener.normal = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
	c = { fg = palette.color400, bg = palette.none },
}

yugener.insert = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugener.visual = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugener.replace = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugener.command = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugener.inactive = {
	a = { fg = palette.blueGray3, bg = palette.background1, gui = 'bold' },
	b = { fg = palette.blueGray3, bg = palette.background1 },
	c = { fg = palette.blueGray3, bg = palette.none },
}

return yugener
