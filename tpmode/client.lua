RegisterCommand("goto", function (_,args)
    local TargetID = tonumber(args[1]) -- Ensure TargetID is a number
    -- No ID error
    if not TargetID then
        TriggerEvent("chat:addMessage", {
            args = {"^1SYSTEM", "You need to specify a valid player ID!"}
        })
        return
    end
    -- Self TP error
    if TargetID == GetPlayerServerId(PlayerId()) then
        TriggerEvent("chat:addMessage", {
            args = {"^1SYSTEM", "You can't teleport to yourself!"}
        })
        return
    end
    TriggerServerEvent('tpmode:goto', TargetID)
end)

RegisterCommand("bring", function (_, args)
    local TargetID = tonumber(args[1]) -- Ensure TargetID is a number
    -- No ID error
    if not TargetID then
        TriggerEvent("chat:addMessage", {
            args = {"^1SYSTEM", "You need to specify a valid player ID!"}
        })
        return
    end
    -- Self bring error
    if TargetID == GetPlayerServerId(PlayerId()) then
        TriggerEvent("chat:addMessage", {
            args = {"^1SYSTEM", "You can't bring yourself!"}
        })
        return
    end
    TriggerServerEvent("tpmode:bring", TargetID)
end)

RegisterNetEvent("tpmode:teleport", function (TargetPos)
    SetEntityCoords(PlayerPedId(), TargetPos)
end)
