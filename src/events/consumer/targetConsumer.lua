TargetEventConsumer = {}

TargetEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

TargetEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end

    local healthConfig = BB_UI_Config[TargetHealthConfig.unitType][TargetHealthConfig.frameName] or TargetHealthConfig
    local powerConfig = BB_UI_Config[TargetPowerConfig.unitType][TargetPowerConfig.frameName] or TargetPowerConfig
    
    local TargetHealth = table.inheritsFrom(BB_Health)
    local TargetPower = table.inheritsFrom(BB_Power)

    TargetHealth:Init(healthConfig)
    TargetPower:Init(powerConfig)
    
    TargetHealth.UpdateTargetClassColor = function(self)
        local classColor = self:ClassColor()
        self.frame.underLine:SetColorTexture(classColor.r, classColor.g, classColor.b, 1)
    end
    
    TargetPower.UpdatePowerColor = function(self)
        local powerType, powerToken = UnitPowerType(self.unitType);
        local color = PowerBarColor[powerToken] or { r = 0, g = 0, b = 0 };
        self.frame.power:SetTextColor(color.r, color.g, color.b)
    end

    TargetHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(TargetHealth))
    TargetPower.frame:SetScript("OnEvent", BBFrame_EventConsumer(TargetPower))
end