-- function applicationWatcher(appName, eventType, appObject)
--     if (eventType == hs.application.watcher.terminated) then
--         hs.alert.show(appName)
--         if (appName == "iTerm2") then
--             hs.alert.show('de')
--             hs.applescript.applescript([[
--                 do shell script "sudo open -a iTerm" password " " with administrator privileges
--              ]])
--             -- hs.application.open("iTerm")
--         end
--     end
-- end
-- appWatcher = hs.application.watcher.new(applicationWatcher)
-- appWatcher:start()
