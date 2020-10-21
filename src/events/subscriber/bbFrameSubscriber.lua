BBFrame_EventSubscriber = function(bbFrame)
    for event, _ in pairs(bbFrame.events) do
        bbFrame.frame:RegisterEvent(event)
    end
end