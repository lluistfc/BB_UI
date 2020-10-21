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

BuildBBFrame = function (unitType, events, frameName, position, originalTable)
    local bbElement = deepcopy(originalTable)
    bbElement["unitType"] = unitType
    bbElement["total"] = UnitHealthMax(unitType)
    bbElement["current"] = UnitHealth(unitType)
    bbElement["events"] = events
    bbElement["frame"] = CreateFrame("Frame", frameName, UIParent, BackdropTemplateMixin and "BackdropTemplate")
    bbElement["ListenTo"] = function(self)

            for event, _ in pairs(self.events) do
                self.frame:RegisterEvent(event)
            end
        end
    bbElement["position"] = position

    return bbElement
end
