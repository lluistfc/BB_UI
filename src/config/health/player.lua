PlayerHealthConfig = {
    unitType = "player",
    events = {
        UNIT_HEALTH = true,
        UNIT_MAXHEALTH = true,
        PLAYER_LOGOUT = true
    },
    frameName = "PlayerHealth",
    frameType = "Button",
    position = { relativeTo = "LEFT", x = 650, y = 0 },
    size = {
        width = 200,
        height = 35
    },
    fonts = {
        healthFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 11
        },
        healthPercentFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 35
        }
    }
}