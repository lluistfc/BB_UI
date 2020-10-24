PlayerEventConsumer = {
    alreadyInitialized = false
}

PlayerEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

PlayerEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil or self.alreadyInitialized == true) then return end
    
    PlayerHealth:BuildElements()
    PlayerPower:BuildElements()
    self.alreadyInitialized = true
end