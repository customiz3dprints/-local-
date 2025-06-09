RegisterCommand('AddWeapon', function (source,args)
    local PlayerPed = PlayerPedId()
    if args[1] == nil then
        TriggerEvent('chat:addMessage', {
            args = { 'You need to specify a weapon!' }
        })
    end
    GiveWeaponToPed(PlayerPed, args[1], 12, falase, true)
    TriggerEvent('chat:addMessage', {
        args = { 'You have been given ' .. args[1] }
    })
end)
