BB_Frame = function(baseClass)

    local new_class = {}
    local class_mt = { __index = new_class }

    function new_class:create()
        local newinst = {}
        setmetatable( newinst, class_mt )
        return newinst
    end

    if nil ~= baseClass then
        setmetatable( new_class, { __index = baseClass } )
    end

    function new_class:PreUpdate() end

    function new_class:SubscribeTo() return BBFrame_EventSubscriber(new_class) end

    function new_class:StopMoving()

        new_class.frame:StopMovingOrSizing()
        
        local from, _, _, x, y = new_class.frame:GetPoint()

        new_class.position.relativeTo = from
        new_class.position.x = x
        new_class.position.y = y
    end

    function new_class:SaveConfig() 
        BB_UI_Config[new_class.unitType][new_class.frame:GetName()] = {
            unitType = new_class.unitType,
            events = new_class.events,
            frameName = new_class.frame:GetName(),
            position = new_class.position,
            size = new_class.size,
            fonts = new_class.fonts
        }
    end

    function new_class:SetConfig(frameConfig)
        new_class.unitType = frameConfig.unitType
        new_class.frameType = frameConfig.frameType or "Frame"
        new_class.total = UnitHealthMax(frameConfig.unitType) or 1
        new_class.current = UnitHealth(frameConfig.unitType) or 0
        new_class.events = frameConfig.events
        
        new_class.position = frameConfig.position
        new_class.fonts = frameConfig.fonts
        new_class.size = frameConfig.size
    end

    function new_class:CreateMainFrame(frameName, frameType)
        new_class.frame = CreateFrame("Button", frameName, UIParent, 'SecureUnitButtonTemplate')
        new_class.frame:SetMovable(true)
        new_class.frame:EnableMouse(true)
        new_class.frame:RegisterForDrag("LeftButton")
        new_class.frame:SetScript("OnDragStart", new_class.frame.StartMoving)
        new_class.frame:SetScript("OnDragStop", new_class.StopMoving)
    end
    return new_class
end