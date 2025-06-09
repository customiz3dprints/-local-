RegisterNetEvent("StatusEffects:SetHunger", function (args)
    SendNuiMessage(json.encode({
        type = "hunger",
        value = args
        })
    )
end)

RegisterNetEvent("StatusEffects:SetThirst", function (args)
    SendNuiMessage(json.encode({
        type = "thirst",
        value = args
        })
    )
end)

RegisterCommand("SetThirst", function (_,args)
    TriggerServerEvent("StatusEffects:SetThirstSQL", args)
end)

RegisterCommand("SetHunger", function (_,args)
    TriggerServerEvent("StatusEffects:SetHungerSQL", args)
end)

RegisterNetEvent("StatusEffects:Kill", function ()
    SetEntityHealth(PlayerPedId(), 0)
end)
CreateThread(function ()
    while true do
        TriggerServerEvent("StatusEffect:UpdateSQL") 
        Wait(10000)
        
    end
    
end)