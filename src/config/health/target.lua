TargetHealthConfig = {
    unitType = "target",
    events = {
        UNIT_HEALTH = true,
        UNIT_MAXHEALTH = true,
        PLAYER_LOGOUT = true,
        PLAYER_TARGET_CHANGED = true,
        UNIT_TARGET = true
    },
    frameName = "TargetHealth",
    frameType = "Button",
    position = { relativeTo = "LEFT", x = 850, y = 0 },
    size = {
        width = 400,
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