TargetEventConsumer = {
    alreadyInitialized = false
}

TargetEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

TargetEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end
    if (self.alreadyInitialized == true) then
        TargetHealth.frame:Hide()
        TargetPower.frame:Hide()
        TargetInfo.frame:Hide()
    end

    TargetHealth:BuildElements()
    TargetPower:BuildElements()
    TargetInfo:BuildElements()
    self.alreadyInitialized = true
end