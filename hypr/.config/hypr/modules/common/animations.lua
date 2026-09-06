hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0 }, { 0.35, 1 } } })

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 5,
	bezier = "overshot",
	style = "slide",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 4,
	bezier = "smoothOut",
	style = "slide",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 10,
	bezier = "smoothIn",
})

hl.animation({
	leaf = "fadeDim",
	enabled = true,
	speed = 10,
	bezier = "smoothIn",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 4,
	bezier = "easeInOutCubic",
	style = "slide",
})
