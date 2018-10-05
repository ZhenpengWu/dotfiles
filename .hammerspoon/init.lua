hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

require("windowResize")
require("spoon")

hs.hotkey.bind(
    hypershift,
    "p",
    function()
        local mail = hs.appfinder.appFromName("Airmail")
        -- local mail = hs.appfinder.appFromName("Mail")

        if mail == nil then
            hs.application.launchOrFocusByBundleID("it.bloop.airmail.beta11")
            -- hs.application.launchOrFocusByBundleID("com.apple.mail")
        else
            if mail:isFrontmost() then
                mail:hide()
            else
                mail:activate()
            end
        end
    end
)

function gotoFinder()
    -- hs.application.launchOrFocus("Finder")
    local finder = hs.appfinder.appFromName("Finder")
    local str_default = {"Go", "Go to Folder…"}
    local default = finder:findMenuItem(str_default)
    finder:selectMenuItem(str_default)
end
hs.hotkey.bind(hypershift, "A", gotoFinder)

function switchVolumeDeviceOutput()
    hs.applescript(
        [[
        tell application "System Events" to tell process "SystemUIServer"
        tell (menu bar item 1 of menu bar 1 whose description contains "volume")
            click
            set target to "Bose Mini II SoundLink"
            set alternative to "Internal Speakers"
            set retry to 1
            set interval to 1
            if exists (menu item 1 of menu 1 whose title is target and value of attribute "AXMenuItemMarkChar" is "✓") then
                set target to alternative
            end if
            repeat with counter from 0 to retry
                try
                    click (menu item target of menu 1)
                    exit repeat
                end try
                if counter < retry then
                    delay (interval)
                else
                    key code 53
                end if
            end repeat
        end tell
    end tell
    ]]
    )
end

hs.hotkey.bind(hypershift, "o", switchVolumeDeviceOutput)

mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
    mouseCircle:setStrokeColor({["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer =
        hs.timer.doAfter(
        3,
        function()
            mouseCircle:delete()
        end
    )
end

hs.hotkey.bind(hypershift, "D", mouseHighlight)
