local mainMod = "SUPER"

hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("wlogout -b 5"))
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true, drag = true })

local screenshotarea =
	'hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify copy area; hyprctl keyword animation "fadeOut,1,4,default"'

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(screenshotarea))
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify --cursor copysave output"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast --notify --cursor copysave screen"))

hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("hyprpicker -a -n"))
hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind(
	"SUPER + space",
	hl.dsp.exec_cmd("killall rofi || rofi -show drun -theme ~/.config/rofi/themes/catppuccin-mocha.rasi")
)

hl.bind("SUPER + escape", hl.dsp.exec_cmd("wlogout --protocol layer-shell -b 5 -t 400 -b 400"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
