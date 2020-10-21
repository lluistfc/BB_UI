BB_Power = {}

BB_Power.Update = function(self)
    self.total = UnitPowerMax(self.unitType)
    self.current = UnitPower(self.unitType)
    self.frame.power:SetText(self.current)
end

BB_Power.Init = function(self)

    self.frame:SetPoint(self.position.relativeTo, self.position.x, self.position.y)
    self.frame:SetSize(self.size.width, self.size.height)
    
    local powerType, powerToken = UnitPowerType(self.unitType);
    local color = PowerBarColor[powerToken];

    self.frame.power = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.power:SetPoint("RIGHT", 0, 0)
    self.frame.power:SetFont(self.fonts.powerFont.src, self.fonts.powerFont.size, "OUTLINE")
    self.frame.power:SetTextColor(color.r, color.g, color.b)

    self:Update()
    self:SubscribeTo()
end