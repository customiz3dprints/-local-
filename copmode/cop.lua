RegisterCommand('cop', function (source,args)
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'[Server]', 'You are now a cop!'}
    })
    
    local modelHash = GetHashKey('csb_cop')
    if not IsModelAPed(modelHash) then
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                multiline = true,
                args = {'[Server]', 'Model not found!'}
            })
        end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
    end
    local pID = PlayerId()
    SetPlayerModel(pID, 'csb_cop')
    SetModelAsNoLongerNeeded(modelHash)
    local playerPed = PlayerPedId()
    GiveWeaponToPed(playerPed, GetHashKey('WEAPON_COMBATPISTOL'), 100, false, false)
    GiveWeaponToPed(playerPed, GetHashKey('WEAPON_NIGHTSTICK'), 1, false, false)
    GiveWeaponToPed(playerPed, GetHashKey('WEAPON_FLASHLIGHT'), 1, false, false)
    GiveWeaponToPed(playerPed, GetHashKey('WEAPON_STUNGUN'), 1, false, false)
    GiveWeaponToPed(playerPed, GetHashKey('WEAPON_PUMPSHOTGUN'), 30, false, false)
    SetPedArmour(playerPed, 100)
end)