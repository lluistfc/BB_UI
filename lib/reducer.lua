function Reducer(bbFrame)
    return function(self, event, ...)
        if bbFrame.events[event] == nil then return end
        bbFrame:Update()
    end
end