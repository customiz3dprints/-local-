RegisterNetEvent('tpmode:goto', function (TargetID)
    local selfID = source
    local targetped = GetPlayerPed(TargetID)
    local TargetPos = GetEntityCoords(targetped)
    if targetped <= 0 then
        TriggerClientEvent('chat:addMessage', selfID, {
            args = {"^1SYSTEM", "Player not found!"}
        })
        return
    end
    TriggerClientEvent('tpmode:teleport', selfID, TargetPos)
end)
RegisterNetEvent('tpmode:bring', function (TargetID)
    local selfID = source
    local targetped = GetPlayerPed(selfID)
    local TargetPos = GetEntityCoords(targetped)
    if targetped <= 0 then
        TriggerClientEvent('chat:addMessage', selfID, {
            args = {"^1SYSTEM", "Player not found!"}
        })
        return
    end
    TriggerClientEvent('tpmode:teleport', TargetID, TargetPos)
end)

TriggerClientEvent("tpmode:teleport", TargetID)