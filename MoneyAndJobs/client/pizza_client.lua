RegisterCommand("StartPizza", function (source)
    local playerID = PlayerPedId()
    local Scooter = `faggio2`
    RequestModel(Scooter)
    while not HasModelLoaded(Scooter) do
        Wait(0)
    end
    local Vehicle = CreateVehicle(Scooter, GetEntityCoords(playerID),GetEntityHeading(playerID), true, true)
    SetModelAsNoLongerNeeded(Scooter)
    local destPos = vector3(386.13, -325.88, 46.35)
    SetNewWaypoint(destPos.x, destPos.y)
    Wait(100)
    TaskWarpPedIntoVehicle(playerID, Vehicle, -1)
    Wait(10)
    SetEntityCoords(Vehicle, 535.0, 106.0, 96.12)
    Wait(10)
    CreateThread(function()
        while true do
            Wait(1000)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - destPos)
            if distance < 3.0 then
                BeginTextCommandThefeedPost('STRING')
                AddTextComponentSubstringPlayerName("Just put it on the ground.")
                ThefeedSetNextPostBackgroundColor(140)
                EndTextCommandThefeedPostMessagetext("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", false, 4, "Customer", GetPlayerName(PlayerId()))
                EndTextCommandThefeedPostTicker(false, false)
                break
            end
        end
        Wait(500)
        SenderID = GetPlayerServerId(PlayerId())
        TriggerServerEvent("MoneyAndJobs:add", SenderID, {SenderID, 2000}, rawCommand)
        DeleteVehicle(Vehicle)
        SetEntityCoords(playerID, 535.0, 106.0, 96.12)
    end)
end)