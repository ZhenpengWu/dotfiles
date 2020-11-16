-- hypershift = {"ctrl", "alt", "cmd", "shift"}

hypershift = {"alt"}

-- Specify Spoons which will be loaded
hspoon_list = {
    -- "AClock",
    -- "BingDaily",
    -- "Calendar",
    -- "CircleClock",
    -- "ClipShow",
    -- "CountDown",
    -- "FnMate",
    -- "HCalendar",
    -- "HSaria2",
    -- "HSearch",
    -- "KSheet",
    -- "SpeedMenu",
    -- "TimeFlow",
    -- "UnsplashZ",
    -- "WinWin",
}

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = {hypershift, "Q"}

-- aria2 RPC host address
hsaria2_host = "http://localhost:6800/jsonrpc"
-- aria2 RPC host secret
hsaria2_secret = "token"

----------------------------------------------------------------------------------------------------

-- clipshowM environment keybinding: System clipboard reader

-- Toggle the display of aria2 frontend
hsaria2_keys = {hypershift, "\\"}

-- Read Hammerspoon and Spoons API manual in default browser
hsman_keys = {hypershift, "H"}

-- Lock computer's screen
hslock_keys = {hypershift, "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {hypershift, "R"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {hypershift, "S"}

-- Show digital clock above all windows
hsaclock_keys = {hypershift, "T"}

-- Toggle Hammerspoon console
hsconsole_keys = {hypershift, "Z"}

-- Toggle Mail Application
hsmail_keys = {hypershift, "P"}

hswinleft_keys = {hypershift, "left"}

hswinright_keys = {hypershift, "right"}

hswinup_keys = {hypershift, "up"}

hswindown_keys = {hypershift, "down"}
