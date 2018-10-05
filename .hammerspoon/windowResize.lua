hs.window.animationDuration = 0.3
hypershift = {"ctrl", "alt", "cmd", "shift"}

local sizes = {2, 3, 3 / 2}
local fullScreenSizes = {1, 4 / 3, 2}

local GRID = {w = 24, h = 24}
hs.grid.setGrid(GRID.w .. "x" .. GRID.h)
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

local pressed = {
    up = false,
    down = false,
    left = false,
    right = false
}

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

hs.hotkey.bind(
    hypershift,
    "right",
    function()
        pressed.right = true
        if pressed.left then
            fullDimension("w")
        else
            nextStep(
                "w",
                true,
                function(cell, nextSize)
                    local win = hs.window.focusedWindow()
                    local f = win:frame()
                    local screen = win:screen()
                    local max = screen:frame()
                    cell.y = max.y
                    cell.h = max.h
                    cell.x = GRID.w - GRID.w / nextSize
                    cell.w = GRID.w / nextSize
                end
            )
        end
    end,
    function()
        pressed.right = false
    end
)

hs.hotkey.bind(
    hypershift,
    "left",
    function()
        pressed.left = true
        if pressed.right then
            fullDimension("w")
        else
            nextStep(
                "w",
                false,
                function(cell, nextSize)
                    local win = hs.window.focusedWindow()
                    local f = win:frame()
                    local screen = win:screen()
                    local max = screen:frame()
                    cell.x = 0
                    cell.y = max.y
                    cell.h = max.h
                    cell.w = GRID.w / nextSize
                end
            )
        end
    end,
    function()
        pressed.left = false
    end
)

hs.hotkey.bind(
    hypershift,
    "up",
    function()
        pressed.up = true
        nextStep(
            "h",
            false,
            function(cell, nextSize)
                cell.y = 0
                cell.h = GRID.h / nextSize
            end
        )
    end,
    function()
        pressed.up = false
    end
)

hs.hotkey.bind(
    hypershift,
    "down",
    function()
        pressed.down = true
        nextStep(
            "h",
            true,
            function(cell, nextSize)
                cell.y = GRID.h - GRID.h / nextSize
                cell.h = GRID.h / nextSize
            end
        )
    end,
    function()
        pressed.down = false
    end
)
