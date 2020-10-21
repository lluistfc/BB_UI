function deepcopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

BuildBBFrame = function (config, originalTable)--unitType, events, frameName, position, originalTable)
    local bbElement = deepcopy(originalTable)
    bbElement["unitType"] = config.unitType
    bbElement["total"] = UnitHealthMax(config.unitType)
    bbElement["current"] = UnitHealth(config.unitType)
    bbElement["events"] = config.events
    bbElement["frame"] = CreateFrame("Frame", config.frameName, UIParent, BackdropTemplateMixin and "BackdropTemplate")
    bbElement["SubscribeTo"] = function(self) return BBFrame_EventSubscriber(self) end
    bbElement["position"] = config.position
    bbElement["fonts"] = config.fonts
    bbElement["size"] = config.size

    return bbElement
end
