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

    local _, class = UnitClass(BB_Health.unitType)
    return RAID_CLASS_COLORS[class] or { r = 0, g = 0, b = 0 }
end

function BB_Health:Update()

    if not UnitExists(BB_Health.unitType) then
        BB_Health.frame:Hide()
        return
    end
    BB_Health.frame:Show()
    BB_Health.total = UnitHealthMax(BB_Health.unitType) or 1
    BB_Health.current = UnitHealth(BB_Health.unitType) or 0

    local parsed = {}
    parsed.total = parseQuantity(BB_Health.total)
    parsed.current = parseQuantity(BB_Health.current)

    local percent = round(BB_Health.current * 100 / BB_Health.total, 0)
    local percentColor = BB_Health:PercentColor(percent)

    BB_Health.frame.health:SetText(parsed.current.." / "..parsed.total)
    BB_Health.frame.percent:SetText(percent.."%")
    BB_Health.frame.percent:SetTextColor(percentColor.r, percentColor.g, percentColor.b)
end

function BB_Health:Init(frameConfig)
    BB_Health:SetConfig(frameConfig)
    BB_Health:CreateMainFrame(frameConfig.frameName)

    BB_Health.frame:SetPoint(BB_Health.position.relativeTo, BB_Health.position.x, BB_Health.position.y)
    BB_Health.frame:SetSize(BB_Health.size.width, BB_Health.size.height)
    
    BB_Health.frame.health = BB_Health.frame:CreateFontString(BB_Health.frame, "OVERLAY")
    BB_Health.frame.health:SetPoint("BOTTOMLEFT", 0, 5)
    BB_Health.frame.health:SetJustifyV("BOTTOM");
    BB_Health.frame.health:SetJustifyH("LEFT");
    BB_Health.frame.health:SetFont(BB_Health.fonts.healthFont.src, BB_Health.fonts.healthFont.size, "OUTLINE")

    BB_Health.frame.percent = BB_Health.frame:CreateFontString(BB_Health.frame, "OVERLAY")
    BB_Health.frame.percent:SetPoint("RIGHT", 2, -2)
    BB_Health.frame.percent:SetFont(BB_Health.fonts.healthPercentFont.src, BB_Health.fonts.healthPercentFont.size, "OUTLINE")

    local classColor = BB_Health:ClassColor()
    
    BB_Health.frame.underLine = BB_Health.frame:CreateLine()
    BB_Health.frame.underLine:SetColorTexture(classColor.r, classColor.g, classColor.b, 1)
    BB_Health.frame.underLine:SetStartPoint("BOTTOMLEFT",0,0)
    BB_Health.frame.underLine:SetEndPoint("BOTTOMRIGHT",0,0)

    BB_Health:Update()
    BB_Health:SubscribeTo()
end