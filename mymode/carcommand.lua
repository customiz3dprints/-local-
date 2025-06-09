RegisterCommand('spawncar', function (source, args)
    
    local ModelHash = args[1] -- Use Compile-time hashes to get the hash of this model
    if not IsModelInCdimage(ModelHash) or not IsModelAVehicle(ModelHash) then return end
    TriggerEvent('chat:addMessage', {
        args = { 'Spawning car...' }
    })
    RequestModel(ModelHash) -- Request the model
    while not HasModelLoaded(ModelHash) do -- Waits for the model to load
        Wait(0)
    end
    local MyPed = PlayerPedId()
    local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false)
    print(ModelHash)
    SetModelAsNoLongerNeeded(ModelHash)
    
end)