local BB_UI = CreateFrame("Frame");

local EventConsumers = {}
EventConsumers["player"] = PlayerEventConsumer
EventConsumers["pet"] = PetEventConsumer

BB_UI:SetScript("OnEvent", function(self, event, ...)
    for _, consumer in pairs(EventConsumers) do
        consumer:Execute(event)
    end
end);

BB_UI:RegisterEvent("PLAYER_ALIVE");
BB_UI:RegisterEvent("PLAYER_ENTERING_WORLD");
BB_UI:RegisterEvent("UNIT_PET")