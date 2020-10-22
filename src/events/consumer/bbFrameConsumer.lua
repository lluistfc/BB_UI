BBFrame_EventConsumer = function(bbFrame)
    return function(self, event, arg1)
        if bbFrame.events[event] == nil then return end

        if (event == "PLAYER_LOGOUT") then
            --bbFrame:SaveConfig()
            return
        elseif ((event == "PLAYER_TARGET_CHANGED" or event == "UNIT_TARGET")) then
            if (bbFrame.frame:GetName() == "TargetHealth") then
                bbFrame:UpdateTargetClassColor()
            elseif bbFrame.frame:GetName() == "TargetPower" then
                bbFrame:UpdatePowerColor()
            end
        end

        bbFrame:Update()
    end
end
