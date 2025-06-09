RegisterNetEvent('GiveWeapon', function (targetId, weaponHash)
    local targetped = GetPlayerPed(targetId)
    GiveWeaponToPed(targetped, weaponHash, 1000, false, true)
end)