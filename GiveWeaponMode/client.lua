RegisterCommand('Give', function (source,args)
    TargetID = tonumber(args[1])
    if not TargetID then
        print('Invalid Player ID')
        return
    end
    WeaponHash = args[2]
    if not WeaponHash then
        print('Invalid Weapon')
        return
    end
    TriggerServerEvent('GiveWeapon', TargetID, WeaponHash)
end)