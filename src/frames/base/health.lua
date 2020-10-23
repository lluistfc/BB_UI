BB_Health = BB_Frame(nil)

function BB_Health:PercentColor(percent)

    if percent >= 75 then
        return { r = 0, g = 1, b = 0 }
    elseif percent >= 31 and percent < 75 then
        return { r = 1, g = 0.5, b = 0 }
    else
        return { r = 1, g = 0, b = 0 }
    end  
end

function BB_Health:ClassColor()

    local _, class = UnitClass(self.unitType)
    return RAID_CLASS_COLORS[class] or { r = 0, g = 0, b = 0 }
end

function BB_Health:Update()

    if not UnitExists(self.unitType) then
        self.frame:Hide()
        return
    end
    self:PreUpdate()
    self.frame:Show()
    self.total = UnitHealthMax(self.unitType) or 1
    self.current = UnitHealth(self.unitType) or 0

    local parsed = {}
    parsed.total = parseQuantity(self.total)
    parsed.current = parseQuantity(self.current)

    local percent = round(self.current * 100 / self.total, 0)
    local percentColor = self:PercentColor(percent)

    self.frame.health:SetText(parsed.current.." / "..parsed.total)
    self.frame.percent:SetText(percent.."%")
    self.frame.percent:SetTextColor(percentColor.r, percentColor.g, percentColor.b)
end

function BB_Health:Init(frameConfig)

    self:SetConfig(frameConfig)
    self:CreateMainFrame(frameConfig.frameName, frameConfig.frameType)

    self.frame:SetPoint(self.position.relativeTo, self.position.x, self.position.y)
    self.frame:SetSize(self.size.width, self.size.height)
    
    self.frame.health = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.health:SetPoint("BOTTOMLEFT", 0, 5)
    self.frame.health:SetJustifyV("BOTTOM");
    self.frame.health:SetJustifyH("LEFT");
    self.frame.health:SetFont(self.fonts.healthFont.src, self.fonts.healthFont.size, "OUTLINE")

    self.frame.percent = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.percent:SetPoint("RIGHT", 2, -2)
    self.frame.percent:SetFont(self.fonts.healthPercentFont.src, self.fonts.healthPercentFont.size, "OUTLINE")

    local classColor = self:ClassColor()
    
    self.frame.underLine = self.frame:CreateLine()
    self.frame.underLine:SetColorTexture(classColor.r, classColor.g, classColor.b, 1)
    self.frame.underLine:SetStartPoint("BOTTOMLEFT",0,0)
    self.frame.underLine:SetEndPoint("BOTTOMRIGHT",0,0)
    
    self.frame:RegisterForClicks('RightButtonUp')
    self.frame:SetAttribute('unit', self.unitType)
    -- Enable targeting unit with LEFT CLICK on it's frame
    -- TODO: Will enable when the configuration panel is created, for now left click is used only to move arround the frames
    --self.frame:SetAttribute('*type1', 'target')
    self.frame:SetAttribute('*type2', 'togglemenu')

    self:Update()
    self:SubscribeTo()
end