-- Class Libraries
class = require 'lib.middleclass'

-- Development Libraries
local lurker = require 'lib.lurker'
local lovebird = require 'lib.lovebird'
inspect = require 'lib.inspect'

-- Game State Management
gamestate = require 'lib.hump.gamestate'

-- Vector library
Vector = require 

-- UI Library
ui = require 'ui'

-- Default Values
values = require 'assets.values.values'

-- States
-- These need to be loaded last as they may use globals defined here.
gameStates = {
    mainMenu = require('states.MainMenu')(),
}

-- Love Callbacks

function love.load()
    -- Initialize HUMP gamestate event handlers
    gamestate.registerEvents()

    -- Switch to the Main Menu state
    gamestate.switch(gameStates.mainMenu)

end

function love.update(deltatime)
    -- Development... TODO: remove
    lurker.update()
    lovebird.update()
end

function love.draw()
end

function love.focus()
end

function love.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
end

function love.mousefocus(focus)
end

function love.mousemoved(x, y, dx, dy, istouch)
end

function love.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
end

function love.quit()
    return false
end

function love.resize(new_width, new_height)
end

function love.textinput(text)
end

function love.visible(visible)
end

function love.wheelmoved(x, y)
end

-- TODO: perhaps add gamepad support