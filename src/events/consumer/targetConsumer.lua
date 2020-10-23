TargetEventConsumer = {}

TargetEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

TargetEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end

    TargetHealth:BuildElements()
    TargetPower:BuildElements()
end