TargetPower = BB_Frame(BB_Power)

function TargetPower:PreUpdate()
    self:UpdatePowerColor()
end

function TargetPower:UpdatePowerColor()

    local powerType, powerToken = UnitPowerType(self.unitType);
    local color = PowerBarColor[powerToken] or { r = 0, g = 0, b = 0 };
    self.frame.power:SetTextColor(color.r, color.g, color.b)
end

function TargetPower:BuildElements()

    local powerConfig = BB_UI_Config[TargetPowerConfig.unitType][TargetPowerConfig.frameName] or TargetPowerConfig
    
    self:Init(powerConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end