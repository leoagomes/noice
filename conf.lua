
love.conf = function(t)
	t.identity = "Noice"
    t.version = "0.11.1"

    t.console = true -- TODO: remove this
    t.accelerometerjoystick = true
    t.externalstorage = false
    t.gammacorrect = false

    t.window.title = "Noice"
    t.window.icon = nil -- TODO: add icon

    t.window.width = 800
    t.window.height = 600

    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 800
    t.window.minheight = 600

    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"

    t.window.vsync = false
    t.window.msaa = 0
    t.window.display = 1
    t.window.highdpi = false
    t.window.x = nil
    t.window.y = nil

    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = false -- TODO: figure out if should add gamepad support
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.window = true
    t.modules.thread = true
end