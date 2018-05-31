Text, Padding = ui.Text, ui.Padding

local MainMenuState = class 'MainMenuState'

function MainMenuState:initialize()
    self.ui = require('assets.layouts.main_menu')
    self.ui:init(nil)
    self.ui:calculateBox()
end

function MainMenuState:init()
end

function MainMenuState:enter(previous)
end

function MainMenuState:leave()
end

function MainMenuState:resume()
end

function MainMenuState:update(deltatime)
    self.ui:update(deltatime)
end

function MainMenuState:draw()
    self.ui:debugDraw(0, 0)
    self.ui:draw(0, 0)
end

function MainMenuState:focus()
end

function MainMenuState:keypressed(key, scancode, isrepeat)
end

function MainMenuState:keyreleased(key, scancode)
end

function MainMenuState:mousepressed(x, y, button, istouch)
end

function MainMenuState:mousereleased(x, y, button, istouch)
end

function MainMenuState:mousemoved(x, y, dx, dy, istouch)
end

function MainMenuState:wheelmoved(x, y)
end

function MainMenuState:quit()
    return false
end

function MainMenuState:resize(w, h)
end

function MainMenuState:textinput(text)
end

function MainMenuState:visible(visible)
end

return MainMenuState