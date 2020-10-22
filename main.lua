local BB_UI = CreateFrame("Frame");
local EventConsumers = {}

EventConsumers["player"] = PlayerEventConsumer
--EventConsumers["pet"] = PetEventConsumer
EventConsumers["target"] = TargetEventConsumer

BB_UI:SetScript("OnEvent", function(self, event, arg1)
    if (event == "ADDON_LOADED" and arg1 == "BB_UI") then
        if (BB_UI_Config == nil) then
            BB_UI_Config = table.deepCopy({ player = {}, pet = {}, target = {} })
        end
    end

    for _, consumer in pairs(EventConsumers) do
        consumer:Execute(event)
    end
end);

BB_UI:RegisterEvent("ADDON_LOADED");
BB_UI:RegisterEvent("PLAYER_ALIVE");
BB_UI:RegisterEvent("PLAYER_ENTERING_WORLD");
BB_UI:RegisterEvent("UNIT_PET");