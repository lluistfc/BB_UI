TargetPowerConfig = {
    unitType = "target",
    events = {
        UNIT_POWER_FREQUENT = true,
        UNIT_MAXPOWER = true,
        PLAYER_LOGOUT = true,
        PLAYER_TARGET_CHANGED = true,
        UNIT_TARGET = true
    },
    frameName = "TargetPower",
    position = { relativeTo = "LEFT", x = 850, y = -35 },
    size = {
        width = 200,
        height = 35
    },
    fonts = {
        powerFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 25
        },
        powerPercentFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 35
        }
    }
}