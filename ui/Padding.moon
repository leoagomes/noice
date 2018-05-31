basePath = (...)\match('(.-)[^%.]+$')

BaseElement = require basePath .. 'BaseElement'

class Padding extends BaseElement
    @debug_color: { 0, 255, 0 }

    new: (arg, params) =>
        if 'number' == type arg
            if params == nil
                params = {}

            params.all = arg
        else
            params = arg
        @params = params

        -- set a Style table in order to maintain inheritability
        @style = @params.style or {}

        -- set child
        @child = params.child

    initialize: (parent) =>
        @parent = parent
        -- Inherit the parent's style
        if @parent and @style.inherit ~= false
            setmetatable @style, __index: parent.style

        -- Initialize child
        if @child
            @child\initialize self

    calculateBox: =>
        -- Set relative position to 0
        @position = Vector 0, 0

        left = @params.left or @params.horizontal or @params.all or 0
        right = @params.right or @params.horitzontal or @params.all or 0
        top = @params.top or @params.vertical or @params.all or 0
        bottom = @params.bottom or @params.vertical or @params.all or 0
        bounds = Vector left + right, top + bottom

        -- If there's a child, add its bounds to this bounds
        if @child
            @child\calculateBox!
            bounds += @child.bounds

        @bounds = bounds

    update: (deltatime) =>
        super deltatime

    draw: (x, y) =>
        left = @params.left or @params.horizontal or @params.all or 0
        right = @params.right or @params.horitzontal or @params.all or 0
        top = @params.top or @params.vertical or @params.all or 0
        bottom = @params.bottom or @params.vertical or @params.all or 0

        if @child
            @child\draw left, top

    debugDraw: (x, y) =>
        local left, right, top, bottom
        left = @params.left or @params.horizontal or @params.all or 0
        right = @params.right or @params.horitzontal or @params.all or 0
        top = @params.top or @params.vertical or @params.all or 0
        bottom = @params.bottom or @params.vertical or @params.all or 0

        love.graphics.setColor @@debug_color
        love.graphics.rectangle 'line', @position.x, @position.y, @bounds.x, @bounds.y

        if @child
            @child\debugDraw left, top