BB_Power = BB_Frame(nil)

function BB_Power:Update()
    if not UnitExists(self.unitType) then
        self.frame:Hide()
        return
    end
    self:PreUpdate()
    self.frame:Show()
    self.total = UnitPowerMax(self.unitType)
    self.current = UnitPower(self.unitType)
    self.frame.power:SetText(self.current)
end

function BB_Power:Init(frameConfig)
    self:SetConfig(frameConfig)
    self:CreateMainFrame(frameConfig.frameName)

    self.frame:SetPoint(self.position.relativeTo, self.position.x, self.position.y)
    self.frame:SetSize(self.size.width, self.size.height)
    
    local powerType, powerToken = UnitPowerType(self.unitType);
    local color = PowerBarColor[powerToken] or { r = 0, g = 0, b = 0 };

    self.frame.power = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.power:SetPoint("RIGHT", 0, 0)
    self.frame.power:SetFont(self.fonts.powerFont.src, self.fonts.powerFont.size, "OUTLINE")
    self.frame.power:SetTextColor(color.r, color.g, color.b)

    self:Update()
    self:SubscribeTo()
end