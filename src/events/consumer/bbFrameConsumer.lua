BBFrame_EventConsumer = function(bbFrame)
    return function(self, event, ...)
        if bbFrame.events[event] == nil then return end
        bbFrame:Update()
    end
end
