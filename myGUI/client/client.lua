-- Nots

function showNotification(msg, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

function showNotificationBetter(msg, color, sender, subject, texturedict, icontype, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(texturedict, texturedict, false, icontype, sender, subject)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand("testNotifications", function (_,_, rawCommand)
    showNotification(
        rawCommand, 
        130,
        true,
        true
    )
end)

RegisterCommand("testNotificationsb", function (_,_, rawCommand)
    showNotificationBetter(
        rawCommand, 
        130,
        "Sender",
        "Subject",
        "CHAR_AMMUNATION",
        8,
        true

    )
end)