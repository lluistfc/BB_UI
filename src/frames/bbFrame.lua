BuildBBFrame = function (config, originalTable)

    local bbElement = table.deepCopy(originalTable)
    
    bbElement["unitType"] = config.unitType
    bbElement["total"] = UnitHealthMax(config.unitType)
    bbElement["current"] = UnitHealth(config.unitType)
    bbElement["events"] = config.events
    
    bbElement["position"] = config.position
    bbElement["fonts"] = config.fonts
    bbElement["size"] = config.size

    bbElement["frame"] = CreateFrame("Frame", config.frameName, UIParent, BackdropTemplateMixin and "BackdropTemplate")

    bbElement["SubscribeTo"] = function(self) return BBFrame_EventSubscriber(self) end
    
    bbElement["StopMoving"] = function(self)
        bbElement.frame:StopMovingOrSizing()
        local from, _, _, x, y = bbElement.frame:GetPoint()
        bbElement.position.relativeTo = from
        bbElement.position.x = x
        bbElement.position.y = y
    end

    bbElement["SaveConfig"] = function(self) 
        BB_UI_Config[self.unitType][self.frame:GetName()] = {
            unitType = self.unitType,
            events = self.events,
            frameName = self.frame:GetName(),
            position = self.position,
            size = self.size,
            fonts = self.fonts
        }
    end

    bbElement.frame:SetMovable(true)
    bbElement.frame:EnableMouse(true)
    bbElement.frame:RegisterForDrag("LeftButton")
    bbElement.frame:SetScript("OnDragStart", bbElement.frame.StartMoving)
    bbElement.frame:SetScript("OnDragStop", bbElement.StopMoving)
    
    return bbElement
end
