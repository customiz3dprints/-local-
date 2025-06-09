CreateThread(function ()
    while true do
        Wait(500)

        local playerId = PlayerPedId()
        local Position = GetEntityCoords(playerId)
        local Heading = GetEntityHeading(playerId)

        SendNuiMessage(json.encode({
            type = 'info',
            x = Position.x,
            y = Position.y,
            z = Position.z,
            heading = Heading
        }))
    end
end)