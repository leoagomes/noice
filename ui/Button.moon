basePath = (...)\match('(.-)[^%.]+$')

BaseElement = require basePath .. 'BaseElement'

class Button extends BaseElement
    new: (params={}) =>
        @params = params

        @style = params.style or {}
        @style.color = @style.color or { 255, 255, 255 }
        @style.hovercolor = @style.hovercolor or { 0, 0, 0 }
        @style.selectioncolor = @style.selectioncolor or { 255, 255, 255 }

        @style.bordercolor = @style.bordercolor or { 255, 255, 255 }
        @style.hoverbordercolor = @style.bordercolor or { 255, 255, 255 }
        @style.selectionbordercolor = @style.selectionbordercolor or { 255, 255, 255 }

        @style.borderwidth = @style.borderwidth or 2

        @style.blockedcolor = @style.blockedcolor or { 127, 127, 127 }

        @actions = params.actions or {}

        stub = () ->
        @actions.onenter = @actions.onenter or stub
        @actions.onleave = @actions.onleave or stub
        @actions.onup = @actions.onup or stub
        @actions.ondown = @actions.ondown or stub

        @actions.checkpressed = @actions.checkpressed or () -> false
        @lastpressed = false

        @selected = params.selected or false
        @over = params.over or false
        @selectable = params.selectable or true

        @child = params.child

        @borderwidth = @style.borderwidth
        @color = @style.color
        @bordercolor = @style.bordercolor

    initialize: (parent) =>
        @parent = parent
        if @actions.inherit ~= false
            setmetatable @actions, __index: @parent.actions

    mousepressed: (x, y, button, istouch) =>
        if x >= 0 and x < @bounds.x and y >= 0 and y < @bounds.y
            @selected = true
            @actions.ondown self, x, y, button, istouch

    mousereleased: (x, y, button, istouch) =>
        @selected = false
        if x >= 0 and x < @bounds.x and y >= 0 and y < @bounds.y
            @actions.onup self, x, y, button, istouch

    mousemoved: (x, y, dx, dy, istouch) =>
        if x >= 0 and x < @bounds.x and y >= 0 and y < @bounds.y
            if @over == false
                @over = true
                @actions.onenter self, x, y, dx, dy, istouch
        else
            if @over == true
                @over = false
                @actions.onleave self, x, y, dx, dy, istouch

    update: (deltatime) =>
        pressed = @actions.checkpressed self
        if @selectable and @over
            if pressed and not @lastpressed
                @actions.ondown self, nil, nil, nil, true
            if not pressed and @lastpressed
                @actions.onup self, nil, nil, nil, true
        @lastpressed = pressed

    draw: (x, y) =>
        color = @color
        borderwidth = @borderwidth
        bordercolor = @bordercolor

        before_color = love.graphics.getColor!

        -- draw the background
        if color != 0
            love.graphics.setColor color
            love.graphics.rectangle 'fill', x, y, @bounds.x, @bounds.y

        -- draw the child
        @child\draw x, y

        -- draw the border
        if borderwidth != 0 and bordercolor != 0
            love.graphics.setColor bordercolor
            love.graphics.setLineWidth borderwidth
            love.graphics.rectangle 'line', x, y, @bounds.x, @bounds.y

        love.graphics.setColor before_color

    debugDraw: (x, y) =>

    calculateBox: =>
        -- use child's bounds for width and height
        @child\calculateBox!
        @bounds = @child.bounds\clone!