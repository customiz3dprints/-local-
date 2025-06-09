RegisterCommand("hoodcontrol", function ()
    local PlayerId = PlayerPedId()
    local VehicleID = GetVehiclePedIsIn(PlayerId)
    if VehicleID > 0 and GetPedInVehicleSeat(VehicleID, -1) then
        if GetVehicleDoorAngleRatio(VehicleID, 4) > 0 then
            SetVehicleDoorShut(VehicleID, 4)
        else
            SetVehicleDoorOpen(VehicleID, 4)
        end
    end
end)

RegisterKeyMapping("hoodcontrol", "Open/close hood", "keyboard", "PAGEUP")
