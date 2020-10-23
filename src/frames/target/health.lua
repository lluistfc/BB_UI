TargetHealth = BB_Frame(BB_Health)

function TargetHealth:PreUpdate()
    self:UpdateTargetClassColor()
end

function TargetHealth:UpdateTargetClassColor()

    local classColor = self:ClassColor()
    self.frame.underLine:SetColorTexture(classColor.r, classColor.g, classColor.b, 1)
end

function TargetHealth:BuildElements()

    local healthConfig = BB_UI_Config[TargetHealthConfig.unitType][TargetHealthConfig.frameName] or TargetHealthConfig
    
    self:Init(healthConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end