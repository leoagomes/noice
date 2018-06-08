basePath = (...)\match('(.-)[^%.]+$')

BaseElement = require basePath .. 'BaseElement'

class List extends BaseElement
    new: (params={}) =>
        @params = params

        @style = params.style or {}

        -- Direction: horizontal, vertical
        @direction = params.direction or 'horizontal'
        -- Align: start, center, end
        @align = params.align or 'start'

        @navigation = params.navigation or {}

        @navigation.next = @navigation.next or nil
        @navigation.previous = @navigation.previous or nil

        @children = params.children or {}
        @current_child = 0

        @last_next = false
        @last_previous = false

    initialize: (parent) =>
        @parent = parent

        if @parent and @style.inherit != false
            setmetatable @style, __index: parent.style

        -- initialize children
        for child in *@children
            child\initialize self

    update: (deltatime) =>
        -- Handle key input
        should_update = false
        if @navigation.next
            ln = @last_next
            n = @navigation.next!
            if ln != n and (not ln and n)
                @current_child += 1
                should_update = true
        if @navigation.prev
            lp = @last_previous
            p = @navigation.previous!
            if lp != p and (not lp and p)
                @current_child -= 1
                should_update = true
        if should_update
            @\update_child!

        -- Update children
        for child in *@children
            child\update deltatime

    draw: (x, y) =>
        curr_x, curr_y = x, y

        for child in *@children
            child\draw curr_x, curr_y

            if @direction == 'horizontal'
            else if @direction == 'vertical'



    debugDraw: (x, y) =>

    calculateBox: =>
        local x_bound, y_bound = 0, 0
        if @direction == 'vertical'
            for child in *@children
                child\calculateBox!
                cb_x, cb_y = child.bounds.x, child.bounds.y

                if cb_x > x_bound
                    x_bound = cb_x

                y_bound += cb_y

        if @direction == 'horizontal'
            for child in *@children
                child\calculateBox!
                cb_x, cb_y = child.bounds.x, child.bounds.y

                x_bound += cb_x

                if cb_y > y_bound
                    y_bound = cb_y

        @bounds = Vector x_bound, y_bound


    mousepressed: (x, y, button, istouch) =>
    mousereleased: (x, y, button, istouch) =>
    mousemoved: (x, y, dx, dy, istouch) =>

    update_child: =>