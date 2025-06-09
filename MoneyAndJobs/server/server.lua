-- Get The amount of money you have
RegisterNetEvent("MoneyAndJobs:balance", function ()
    local playerID = source
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (money)
        if not money then
            TriggerClientEvent("chat:addMessage", playerID, {
                args = {"SYSTEM", "You don't have a base log. Creating one with the base value of 2000$"}
            })
            MySQL.insert("INSERT INTO money (ID, MoneyVal) VALUES (?, ?)", {
                playerLicense,
                2000
            })
        else
            TriggerClientEvent("chat:addMessage", playerID, {
                args = {"SYSTEM", "You have " .. money .. "$"}
            })
        end
    end)
end)

-- Set The amount of money a palyer has
RegisterNetEvent("MoneyAndJobs:set", function (_, args, rawCommand)
    SenderID = source
    local playerID = args[1]
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (money)
        if not money then
            TriggerClientEvent("chat:addMessage", playerID, {
                color = {0,0,255},
                args = {"SYSTEM", "This player does not have a base log. Creating one with the base value of" .. args[2] .. "$"}
            })
            MySQL.insert("INSERT INTO money (ID, MoneyVal) VALUES (?, ?)", {
                playerLicense,
                2000
            })
        else
            MySQL.update("UPDATE money SET MoneyVal = ? WHERE ID = ?",{
                args[2],
                playerLicense
            }, function ()
                TriggerClientEvent("chat:addMessage", SenderID, {
                        color = {0,0,255},
                        args = {"SYSTEM","Set " .. GetPlayerName(args[1]) .. "'s balance to " .. args[2].. " making it " .. args[2] .. "$."}
                    })
            end)
        end
    end)
end)

-- Add an amount of money to a player's balance
RegisterNetEvent("MoneyAndJobs:add", function (_, args, rawCommand)
    local SenderID = source
    local playerID = args[1]
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (balance)
        if not balance then
            TriggerClientEvent("chat:addMessage", SenderID, {
                args = {"SYSTEM","This player does not have an in-game bank account"}
            })
            return
        end
        MySQL.update("UPDATE money SET MoneyVal = ? WHERE ID = ?",{
            balance + args[2],
            playerLicense
        })
        TriggerClientEvent("chat:addMessage", SenderID, {
                color = {0,255,0},
                args = {"SYSTEM","Added " .. args[2] .. " to " .. GetPlayerName(args[1]) .. "'s balance, making it " .. balance + args[2] .. "$."}
        })
    end)
end)

-- Remove an amount of money from a player's balance
RegisterNetEvent("MoneyAndJobs:remove", function (_, args, rawCommand)
    local SenderID = source
    local playerID = args[1]
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (balance)
        if not balance then
            TriggerClientEvent("chat:addMessage", SenderID, {
                
                args = {"SYSTEM","This player does not have an in-game bank account"}
            })
            return
        end
        
        MySQL.update("UPDATE money SET MoneyVal = ? WHERE ID = ?",{
            balance - args[2],
            playerLicense
        })
        TriggerClientEvent("chat:addMessage", SenderID, {
                color = {255,0,0},
                args = {"SYSTEM","Removed " .. args[2] .. " from " .. GetPlayerName(args[1]) .. "'s balance, making it " .. balance - args[2] .. "$."}
        })
    end)
end)

--Update NUI
RegisterNetEvent("MoneyAndJobs:GetMoneyNUI", function ()
    local playerID = source
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (balance)
        TriggerClientEvent("MoneyAndJobs:updateMoney", playerID, balance or 0)
    end)
end)

lib.callback.register("MoneyAndJobs:ShopBuy", function ()
    local playerID = source
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    
    local balance = MySQL.scalar.await("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    })

    if not balance then
        TriggerClientEvent("chat:addMessage", playerID, {
            args = {"SYSTEM", "You don't seem to have an account. Use /GetBalance to create one."}
        })
        return 0
    end

    return balance
end)

-- Works with shop_client.lua, a simple deduction
RegisterNetEvent("MoneyAndJobs:buy", function (_, args, rawCommand)
    local playerID = source
    local playerLicense = GetPlayerIdentifierByType(playerID, "license")
    MySQL.scalar("SELECT MoneyVal FROM money WHERE ID = ?", {
        playerLicense
    }, function (money)
        if not money then
            return
        end
        MySQL.update("UPDATE money SET MoneyVal = ? WHERE ID = ?",{
            args,
            playerLicense
        })
    end)
end)