BB_Power = BB_Frame(nil)

function BB_Power:Update()
    if not UnitExists(BB_Power.unitType) then
        self.frame:Hide()
        return
    end
    BB_Power.frame:Show()
    BB_Power.total = UnitPowerMax(BB_Power.unitType)
    BB_Power.current = UnitPower(BB_Power.unitType)
    BB_Power.frame.power:SetText(BB_Power.current)
end

function BB_Power:Init(frameConfig)
    BB_Power:SetConfig(frameConfig)
    BB_Power:CreateMainFrame(frameConfig.frameName)

    BB_Power.frame:SetPoint(BB_Power.position.relativeTo, BB_Power.position.x, BB_Power.position.y)
    BB_Power.frame:SetSize(BB_Power.size.width, BB_Power.size.height)
    
    local powerType, powerToken = UnitPowerType(BB_Power.unitType);
    local color = PowerBarColor[powerToken] or { r = 0, g = 0, b = 0 };

    BB_Power.frame.power = BB_Power.frame:CreateFontString(BB_Power.frame, "OVERLAY")
    BB_Power.frame.power:SetPoint("RIGHT", 0, 0)
    BB_Power.frame.power:SetFont(BB_Power.fonts.powerFont.src, BB_Power.fonts.powerFont.size, "OUTLINE")
    BB_Power.frame.power:SetTextColor(color.r, color.g, color.b)

    BB_Power:Update()
    BB_Power:SubscribeTo()
end