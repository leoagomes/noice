basePath = (...)\match('(.-)[^%.]+$')

BaseElement = require basePath .. 'BaseElement'

class ItemList extends BaseElement
    new: (params={}) =>
        -- Align: start, center, end
    initialize: (parent) =>
    update: (deltatime) =>

    draw: (x, y) =>
    debugDraw: (x, y) =>
    calculateBox: =>

    mousepressed: (x, y, button, istouch) =>
    mousereleased: (x, y, button, istouch) =>
    mousemoved: (x, y, dx, dy, istouch) =>