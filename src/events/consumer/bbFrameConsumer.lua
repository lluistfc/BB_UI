BBFrame_EventConsumer = function(bbFrame)
    return function(self, event, ...)
        if bbFrame.events[event] == nil then return end

        if (event == "PLAYER_LOGOUT") then
            bbFrame:SaveConfig()
            return
        end
        bbFrame:Update()
    end
end
