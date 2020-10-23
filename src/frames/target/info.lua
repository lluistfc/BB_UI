TargetInfo = BB_Frame(nil)

function TargetInfo:SetConfig(frameConfig)
    self.unitType = frameConfig.unitType
    self.events = frameConfig.events
    
    self.position = frameConfig.position
    self.fonts = frameConfig.fonts
    self.size = frameConfig.size
end

function TargetInfo:Update()
    if not UnitExists(self.unitType) then
        self.frame:Hide()
        return
    end
    
    local info = ""
    local name, _ = UnitName(self.unitType)
    local level = UnitLevel(self.unitType)
    local marker = GetRaidTargetIndex(self.unitType)
    local classification = UnitClassification(self.unitType);

    info = info .. name

    if (level == -1) then
        info = info .. "   -   LVL "..CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", 64, 64, 16, 16, 0, 1, 0, 1)
    else
        info = info .. "   -   LVL "..level
    end

    if (classification == "worldboss") then
        info = info .. "    >> BOSS <<"
    elseif (classification == "rare" or classification == "rareelite") then
        info = info .. "    >> RARE <<"
    elseif classification == "elite" then
        info = info .. "    >> ELITE <<"
    end

    if (marker ~= nil) then
        self.frame.raidMarker:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..marker)
    else
        self.frame.raidMarker:SetTexture(nil)
    end

    self.frame.unitInfo:SetText(info)
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