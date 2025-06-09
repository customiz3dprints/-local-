RegisterNetEvent("StatusEffect:UpdateSQL", function ()
    local playerID = source
    local playerLicense = GetPlayerIdentifierByType(source, "license")
    MySQL.single("SELECT Hunger, Thirst FROM status WHERE ID = ?", {
        playerLicense
    }, function (stats)
        if not stats then
            MySQL.insert("INSERT INTO status (ID, Hunger, Thirst) VALUES (?, ?, ?)",{
                playerLicense,
                100,
                100
            })
        end
        --Thirst
        if stats.Thirst-1 <= 0 then
            TriggerClientEvent("StatusEffects:Kill", playerID)
            Wait(4000)
            MySQL.update("UPDATE status SET Thirst = 100 WHERE ID = ?", {
                playerLicense
            })
            TriggerClientEvent("StatusEffects:SetThirst", playerID, 100.0)
        else
            TriggerClientEvent("StatusEffects:SetThirst", playerID, stats.Thirst-1)
            MySQL.update("UPDATE status SET Thirst = ? WHERE ID = ?",{
                stats.Thirst-1,
                playerLicense
            })
        end
        --Hunger
        if stats.Hunger-1 <= 0 then
            TriggerClientEvent("StatusEffects:Kill", playerID)
            Wait(4000)  
            MySQL.update("UPDATE status SET Hunger = 100 WHERE ID = ?", {
                playerLicense
            })
            TriggerClientEvent("StatusEffects:SetHunger", playerID, 100.0)
        else
            TriggerClientEvent("StatusEffects:SetHunger", playerID, stats.Hunger-1)
            MySQL.update("UPDATE status SET Hunger = ? WHERE ID = ?",{
                stats.Hunger-1,
                playerLicense
            })
        end
    end)
end)

RegisterNetEvent("StatusEffects:SetHungerSQL", function (args)
    local playerID = args[1]
    local playerLicense = GetPlayerIdentifierByType(source, "license")
    if not playerLicense then
        TriggerClientEvent("chat:addMessage", playerID, {
            color = {255,0,0},
            args = {"Server", "Invalid playerID. Usage: /SetHunger <PlayerID> <Amount (1-100)>"},
        })
        return
    end 
    if not tonumber(args[2]) or tonumber(args[2]) > 100 or tonumber(args[2]) < 0 then
        TriggerClientEvent("chat:addMessage", playerID, {
            color = {255,0,0},
            args = {"Server", "Invalid number. Usage: /SetHunger <PlayerID> <Amount (1-100)>"},
        })
    end
    MySQL.update("UPDATE status SET Hunger = ? WHERE ID = ?",{
        args[2],
        playerLicense
    })
    TriggerClientEvent("StatusEffects:SetHunger", playerID, args[2])
    TriggerClientEvent("chat:addMessage", source, {
            color = {0,255,0},
            args = {"Server", "Set " ..GetPlayerName(playerID) .. "'s hunger to " .. args[2]},
        })
    TriggerClientEvent("chat:addMessage", playerID, {
            color = {0,0,255},
            args = {"Server", GetPlayerName(source) .. " set your hunger to " .. args[2]},
        })
end)

RegisterNetEvent("StatusEffects:SetThirstSQL", function (args)
    local playerID = args[1]
    local playerLicense = GetPlayerIdentifierByType(source, "license")
    if not playerLicense then
        TriggerClientEvent("chat:addMessage", playerID, {
            color = {255,0,0},
            args = {"Server", "Invalid playerID. Usage: /SetThirst <PlayerID> <Amount (1-100)>"},
        })
        return
    end 
    if not tonumber(args[2]) or tonumber(args[2]) > 100 or tonumber(args[2]) < 0 then
        TriggerClientEvent("chat:addMessage", playerID, {
            color = {255,0,0},
            args = {"Server", "Invalid number. Usage: /SetThirst <PlayerID> <Amount (1-100)>"},
        })
    end
    MySQL.update("UPDATE status SET Thirst = ? WHERE ID = ?",{
        args[2],
        playerLicense
    })
    TriggerClientEvent("StatusEffects:SetThirst", playerID, args[2])
    TriggerClientEvent("chat:addMessage", source, {
            color = {0,255,0},
            args = {"Server", "Set " ..GetPlayerName(playerID) .. "'s thirst to " .. args[2]},
        })
    TriggerClientEvent("chat:addMessage", playerID, {
            color = {0,0,255},
            args = {"Server", GetPlayerName(source) .. " set your thirst to " .. args[2]},
        })
end)