-- Get this files base path
thisFile = ...
basePath = thisFile .. '.' -- thisFile\match('(.-)[^%.]+$')

-- Assert there is a Vector implementation available
assert Vector ~= nil

-- Import other components into the return table
ui =
    BaseElement: require basePath .. 'BaseElement'
    Text: require basePath .. 'Text'
    Padding: require basePath .. 'Padding'
    Button: require basePath .. 'Button'

-- Return the UI table
return ui