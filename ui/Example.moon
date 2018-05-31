-- Just for me to think

simpleText = Text 'Text',
    style:
        -- In order for an element not to inherit its parent's style,
        -- "inherit" should be explicitly set to false
        inherit: false
        font: fonts.vcr
        color: { 255, 255, 255 }
        xscale: 1
        yscale: 1
        scale: 1
        rotation: 0

paddedText = Padding
    -- Available padding position options:
    -- all, horizontal, vertical, top, bottom, left, right
    -- the value is in pixels
    all: 10
    child: Text 'Padded Text'
    -- There is no style for padding... setting its style>>inherited to false,
    -- though, prevents its child from inheriting any styles above this padding
    style:
        inherit: false

simpleButton =
    Button:
        selected: false
        selectable: true
        actions:
            inherit: false
            checkselect: () -> baton:get 'menu-select'

            onenter: () -> -- Select callback
            onleave: () -> -- Hover code
            ondown: () -> -- Button press or mouse down
            onup: () -> -- Button release of mouse up

        style:
            inherit: false

            color: { 255, 0, 0 }
            backgroundcolor: { 255, 255, 0 }
            bordercolor: { 0, 255, 0 }
            hovercolor: { 0, 0, 255 }

        child: Padding
            all: 10
            style:
                inherit: false
            child: Text 'Button'
                style:
                    font: fonts.vcr
                    color: { 255, 255, 255 }