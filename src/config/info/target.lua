TargetInfoConfig = {
    unitType = "target",
    events = {
        PLAYER_LOGOUT = true,
        PLAYER_TARGET_CHANGED = true,
        UNIT_TARGET = true
    },
    frameName = "TargetInfo",
    position = { relativeTo = "LEFT", x = 850, y = 20 },
    size = {
        width = 400,
        height = 35
    },
    fonts = {
        infoFont = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 12
        },
        infoFontBig = {
            src = "Fonts\\FRIZQT__.TTF",
            size = 35
        }
    }
}