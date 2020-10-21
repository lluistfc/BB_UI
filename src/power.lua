--[[BB_Power = CreateBBFrame(
    "player",
    {
        UNIT_POWER_FREQUENT = true,
        UNIT_MAXPOWER = true
    },
    "Power",
    { relativeTo = "LEFT", x = 650, y = -35 }
)]]--

BB_Power = {}

BB_Power.Update = function(self)
    self.total = UnitPowerMax(self.unitType)
    self.current = UnitPower(self.unitType)
    self.frame.power:SetText(self.current)
end

BB_Power.Init = function(self)

    self.frame:SetPoint(self.position.relativeTo, self.position.x, self.position.y)
    self.frame:SetSize(200, 35)
    
    local powerType, powerToken = UnitPowerType(self.unitType);
    local color = PowerBarColor[powerToken];

    self.frame.power = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.power:SetPoint("RIGHT", 0, 0)
    self.frame.power:SetFont("Fonts\\FRIZQT__.TTF", 25, "OUTLINE")
    self.frame.power:SetTextColor(color.r, color.g, color.b)

    self:Update()
    self:ListenTo()
end