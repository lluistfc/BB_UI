PlayerEventConsumer = {}

PlayerEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

PlayerEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end
    
    PlayerHealth:BuildElements()
    PlayerPower:BuildElements()
end