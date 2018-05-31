basePath = (...)\match('(.-)[^%.]+$')

BaseElement = require basePath .. 'BaseElement'

class Text extends BaseElement
    @debug_color: { 255, 255, 255 }

    new: (text, params = {}) =>
        @text = text
        @params = params

        -- Set style up
        @style = params.style or {}

    initialize: (parent) =>
        @parent = parent
        -- Set style to point recursively to parent's
        if @parent and @style.inherit ~= false
            setmetatable @style, __index: parent.style

    calculateBox: =>
        font = @style.font or love.graphics.getFont!
        xScale = @style.xscale or @style.scale or 1
        yScale = @style.yscale or @style.scale or 1
        normalWidth = xScale * font\getWidth @text
        normalHeight = yScale * font\getHeight! * font\getLineHeight!

        if @style.rotation != 0
            sin, cos, abs = math.sin, math.cos, math.abs
            rotation = @style.rotation or 0
            width = abs(cos(rotation) * normalWidth) + abs(sin(rotation) * normalHeight)
            height = abs(sin(rotation) * normalWidth) + abs(cos(rotation) * normalHeight)
            normalWidth = width
            normalHeight = height

        @bounds = Vector normalWidth, normalHeight

        -- Text position is fixed at relative 0,0
        @position = Vector 0, 0

    update: (deltatime) =>
        super deltatime

    draw: (x, y) =>
        super x, y
        rotation = @style.rotation or 0
        xScale = @style.xscale or @style.scale or 1
        yScale = @style.yscale or @style.scale or 1

        if @style.color
            love.graphics.setColor @style.color

        love.graphics.setFont @style.font or love.graphics.getFont!

        if @style.color
            love.graphics.setColor @style.color

        love.graphics.print @text, x + @position.x, y + @position.y, rotation,
            xScale, yScale

    debugDraw: (x, y) =>
        super x, y
        love.graphics.setColor @@debug_color
        love.graphics.rectangle 'line', x + @position.x, y + @position.y,
            @bounds.x, @bounds.y