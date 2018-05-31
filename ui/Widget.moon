class Widget
    new: (params = {}) =>
        @style = params.style
        @position = params.position
        @parent = nil
        @children = params.children