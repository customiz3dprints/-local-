RegisterCommand('rnpc', function(source, args)
    -- Define the list of ped models
    local PedModelList = {'a_m_y_skater_02', 'a_m_y_vinewood_01'}

    -- Pick a random model from the list
    local PedModel = PedModelList[math.random(1, #PedModelList)]

    -- Load the model
    RequestModel(PedModel)
    while not HasModelLoaded(PedModel) do
        Citizen.Wait(0)
    end

    -- Get the player's coordinates and heading
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)

    -- Create the ped
    local npc = CreatePed(4, PedModel, playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, false, false)

    -- Optionally set some behavior for the ped (e.g., make it idle or follow the player)
    SetEntityAsMissionEntity(npc, true, true)

    -- Notify the player in chat
    TriggerEvent('chat:addMessage', {
        args = { 'NPC spawned!' }
    })

    -- Release the model to free memory
    SetModelAsNoLongerNeeded(PedModel)
end)
