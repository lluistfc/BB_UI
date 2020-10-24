TargetInfo = BB_Frame(nil)

local TARGET_INFO_LEVEL_PREFIX = "   -   LVL "

local TARGET_CLASSIFICATION_RARE = "    >> RARE <<"
local TARGET_CLASSIFICATION_BOSS = "    >> BOSS <<"
local TARGET_CLASSIFICATION_ELITE = "    >> ELITE <<"

local TARGET_INFO_MOB_CLASSIFICATION = {
    ["rare"] = TARGET_CLASSIFICATION_RARE,
    ["rareelite"] = TARGET_CLASSIFICATION_RARE,
    ["worldboss"] = TARGET_CLASSIFICATION_BOSS,
    ["elite"] = TARGET_CLASSIFICATION_ELITE
}

function TargetInfo:GetLevel()

    local level = UnitLevel(self.unitType)

    if (level == -1) then
        level = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", 64, 64, 16, 16, 0, 1, 0, 1)
    end

    return TARGET_INFO_LEVEL_PREFIX .. level
end

function TargetInfo:SetConfig(frameConfig)

    self.unitType = frameConfig.unitType
    self.events = frameConfig.events
    
    self.position = frameConfig.position
    self.fonts = frameConfig.fonts
    self.size = frameConfig.size
end

function TargetInfo:UpdateRaidMarker()

    local marker = GetRaidTargetIndex(self.unitType)

    if (marker ~= nil) then
        self.frame.raidMarker:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..marker)
    else
        self.frame.raidMarker:SetTexture(nil)
    end
end

function TargetInfo:GetUnitClassification()

    local classification = UnitClassification(self.unitType);

    return TARGET_INFO_MOB_CLASSIFICATION[classification] or ""
end

function TargetInfo:UpdateUnitInfo()

    local name, _ = UnitName(self.unitType)

    self.frame.unitInfo:SetText(name .. self:GetLevel() .. self:GetUnitClassification())
end

function TargetInfo:Update()

    if not UnitExists(self.unitType) then
        self.frame:Hide()
        return
    end
    
    self:UpdateUnitInfo()
    self:UpdateRaidMarker()

    self.frame:Show()
end

function TargetInfo:Init(frameConfig)
    
    self:SetConfig(frameConfig)
    self:CreateMainFrame(frameConfig.frameName)

    self.frame:SetPoint(self.position.relativeTo, self.position.x, self.position.y)
    self.frame:SetSize(self.size.width, self.size.height)
    
    self.frame.unitInfo = self.frame:CreateFontString(self.frame, "OVERLAY")
    self.frame.unitInfo:SetPoint("LEFT", 0, 0)
    self.frame.unitInfo:SetFont(self.fonts.infoFont.src, self.fonts.infoFont.size, "OUTLINE")

    self.frame.raidMarker = self.frame:CreateTexture()
    self.frame.raidMarker:SetPoint("RIGHT", 0, 0)
    self.frame.raidMarker:SetSize(35, 35)

    self:Update()
    self:SubscribeTo()
end

function TargetInfo:BuildElements()

    local infoConfig = BB_UI_Config[TargetInfoConfig.unitType][TargetInfoConfig.frameName] or TargetInfoConfig
    
    self:Init(infoConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end