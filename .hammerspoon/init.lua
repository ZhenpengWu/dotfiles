hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- Use the standardized config location, if present
custom_config = hs.fs.pathToAbsolute(os.getenv("HOME") .. '/.config/hammerspoon/private/config.lua')
if custom_config then
    print("Loading custom config")
    dofile( os.getenv("HOME") .. "/.config/hammerspoon/private/config.lua")
    privatepath = hs.fs.pathToAbsolute(hs.configdir .. '/private/config.lua')
    if privatepath then
        hs.alert("You have config in both .config/hammerspoon and .hammerspoon/private.\nThe .config/hammerspoon one will be used.")
    end
else
    -- otherwise fallback to 'classic' location.
    if not privatepath then
        privatepath = hs.fs.pathToAbsolute(hs.configdir .. '/private')
        -- Create `~/.hammerspoon/private` directory if not exists.
        hs.fs.mkdir(hs.configdir .. '/private')
    end
    privateconf = hs.fs.pathToAbsolute(hs.configdir .. '/private/config.lua')
    if privateconf then
        -- Load awesomeconfig file if exists
        require('private/config')
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
    hs.reload()
end):start()

hs.alert.show("Config loaded")

-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
hs.loadSpoon("ModalMgr")

-- Define default Spoons which will be loaded later
if not hspoon_list then
    hspoon_list = {
        "AClock",
        "BingDaily",
        "CircleClock",
        "ClipShow",
        "CountDown",
        "HCalendar",
        "HSaria2",
        "HSearch",
        "SpeedMenu",
        "WinWin",
        "FnMate",
    }
end

-- Load those Spoons
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end


----------------------------------------------------------------------------------------------------
-- Register lock screen
hslock_keys = hslock_keys or {"alt", "L"}
if string.len(hslock_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hslock_keys[1], hslock_keys[2], "Lock Screen", function()
        hs.caffeinate.lockScreen()
    end)
end


----------------------------------------------------------------------------------------------------
-- Register Hammerspoon console
hsconsole_keys = hsconsole_keys or {"alt", "Z"}
if string.len(hsconsole_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hsconsole_keys[1], hsconsole_keys[2], "Toggle Hammerspoon Console", function() hs.toggleConsole() end)
end

----------------------------------------------------------------------------------------------------
-- Toogle Mail Application
hsmail_keys = hsmail_keys or {"alt", "M"}
if string.len(hsmail_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hsmail_keys[1], hsmail_keys[2], "Toggle Mail Application", function() 
        -- local mail = hs.appfinder.appFromName("Airmail")
        local mail = hs.appfinder.appFromName("Mail")
        -- local mail = hs.appfinder.appFromName("Canary Mail")
        -- local mail = hs.appfinder.appFromName("Spark")

        if mail == nil then
            -- hs.application.launchOrFocusByBundleID("it.bloop.airmail.beta11")
            hs.application.launchOrFocusByBundleID("com.apple.mail")
            -- hs.application.launchOrFocusByBundleID("io.canarymail.mac")
            -- hs.application.launchOrFocusByBundleID("com.readdle.smartemail-Mac")

        else
            if mail:isFrontmost() then
                mail:hide()
            else
                mail:activate()
            end
        end
    end)
end


----------------------------------------------------------------------------------------------------
-- Toogle Window Manipulation
local sizes = {2, 3, 3 / 2}
local fullScreenSizes = {1, 4 / 3, 2}

local GRID = {w = 24, h = 24}
hs.grid.setGrid(GRID.w .. "x" .. GRID.h)
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

local pressed = { up = false, down = false, left = false, right = false }

function nextStep(dim, offs, cb)
    if hs.window.focusedWindow() then
        local axis = dim == "w" and "x" or "y"
        local oppDim = dim == "w" and "h" or "w"
        local oppAxis = dim == "w" and "y" or "x"
        local win = hs.window.frontmostWindow()
        local id = win:id()
        local screen = win:screen()

        cell = hs.grid.get(win, screen)

        local nextSize = sizes[1]
        for i = 1, #sizes do
            if
                cell[dim] == GRID[dim] / sizes[i] and
                    (cell[axis] + (offs and cell[dim] or 0)) == (offs and GRID[dim] or 0)
             then
                nextSize = sizes[(i % #sizes) + 1]
                break
            end
        end

        cb(cell, nextSize)
        if cell[oppAxis] ~= 0 and cell[oppAxis] + cell[oppDim] ~= GRID[oppDim] then
            cell[oppDim] = GRID[oppDim]
            cell[oppAxis] = 0
        end

        hs.grid.set(win, cell, screen)
    end
end

function fullDimension(dim)
    if hs.window.focusedWindow() then
        local win = hs.window.frontmostWindow()
        local id = win:id()
        local screen = win:screen()
        cell = hs.grid.get(win, screen)

        if (dim == "x") then
            cell = "0,0 " .. GRID.w .. "x" .. GRID.h
        else
            cell[dim] = GRID[dim]
            cell[dim == "w" and "x" or "y"] = 0
        end

        hs.grid.set(win, cell, screen)
    end
end

hswinleft_keys = hswinleft_keys or {"alt", "left"}
if string.len(hswinleft_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hswinleft_keys[1], hswinleft_keys[2], "Left Half", function() 
        pressed.left = true
        if pressed.right then
            fullDimension("w")
        else
            nextStep("w", false,
                function(cell, nextSize)
                    local win = hs.window.focusedWindow()
                    local f = win:frame()
                    local screen = win:screen()
                    local max = screen:frame()
                    cell.x = 0
                    cell.y = max.y
                    cell.h = max.h
                    cell.w = GRID.w / nextSize
                end)
        end
    end,
    function() pressed.left = false end)
end

hswinright_keys = hswinright_keys or {"alt", "right"}
if string.len(hswinright_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hswinright_keys[1], hswinright_keys[2], "Right Half", function() 
        pressed.right = true
        if pressed.left then
            fullDimension("w")
        else
            nextStep("w", true,
                function(cell, nextSize)
                    local win = hs.window.focusedWindow()
                    local f = win:frame()
                    local screen = win:screen()
                    local max = screen:frame()
                    cell.y = max.y
                    cell.h = max.h
                    cell.x = GRID.w - GRID.w / nextSize
                    cell.w = GRID.w / nextSize
                end)
        end
    end,
    function() pressed.right = false end)
end

hswinup_keys = hswinup_keys or {"alt", "up"}
if string.len(hswinup_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hswinup_keys[1], hswinup_keys[2], "Up Half", function() 
        pressed.up = true
        nextStep("h", false,
            function(cell, nextSize)
                cell.y = 0
                cell.h = GRID.h / nextSize
            end)
    end,
    function() pressed.up = false end)
end

hswindown_keys = hswindown_keys or {"alt", "down"}
if string.len(hswindown_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hswindown_keys[1], hswindown_keys[2], "Down Half", function() 
        pressed.down = true
        nextStep("h", true,
            function(cell, nextSize)
                cell.y = GRID.h - GRID.h / nextSize
                cell.h = GRID.h / nextSize
            end)
    end,
    function() pressed.down = false end)
end

----------------------------------------------------------------------------------------------------
-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()