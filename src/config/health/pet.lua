PetHealthConfig = {
    unitType = "pet",
    events = {
        UNIT_HEALTH = true,
        UNIT_MAXHEALTH = true,
        UNIT_PET = true,
        PLAYER_LOGOUT = true
    },
    frameName = "PetHealth",
    frameType = "Button",
    position = { relativeTo = "LEFT", x = 675, y = -90 },
    size = {
        width = 175,
        height = 25
    },
    fonts = {
        healthFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 11
        },
        healthPercentFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 25
        }
    }
}