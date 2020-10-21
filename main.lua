local BB_UI = CreateFrame("Frame");

BB_UI:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ALIVE" or event == "PLAYER_ENTERING_WORLD") then
        local PlayerHealth = BuildBBFrame(
            "player",
            {
                UNIT_HEALTH = true,
                UNIT_MAXHEALTH = true
            },
            "PlayerHealth",
            { relativeTo = "LEFT", x = 650, y = 0 },
            BB_Health
        )

        local PlayerPower = BuildBBFrame(
            "player",
            {
                UNIT_POWER_FREQUENT = true,
                UNIT_MAXPOWER = true
            },
            "PlayerPower",
            { relativeTo = "LEFT", x = 650, y = -35 },
            BB_Power
        )


        PlayerHealth:Init()
        PlayerPower:Init()

        PlayerHealth.frame:SetScript("OnEvent", Reducer(PlayerHealth))
        PlayerPower.frame:SetScript("OnEvent", Reducer(PlayerPower))
    elseif event == "UNIT_PET" then
        local PetHealth = BuildBBFrame(
            "pet",
            {
                UNIT_HEALTH = true,
                UNIT_MAXHEALTH = true,
                UNIT_PET = true
            },
            "PetHealth",
            { relativeTo = "LEFT", x = 860, y = -120 },
            BB_Health
        )

        PetHealth:Init()
        PetHealth.frame:SetScript("OnEvent", Reducer(PetHealth))
        PetHealth.frame:SetScale(0.8)      
    else

    end
end);

BB_UI:RegisterEvent("PLAYER_ALIVE");
BB_UI:RegisterEvent("PLAYER_ENTERING_WORLD");
BB_UI:RegisterEvent("UNIT_PET")