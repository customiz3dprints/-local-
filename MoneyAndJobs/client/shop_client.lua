RegisterCommand("MoneyAndJobs:shop", function ()
    lib.registerContext({
        id = "shop",
        title = "Custom Shop",
        options = {{
            title = "Car",  
            description = "You can buy a car with 2000$",
            onSelect = function ()
                lib.callback("MoneyAndJobs:ShopBuy", false, function (balance)
                    if balance < 2000 then
                        lib.notify({
                            type = "error",
                            title = "Not enough funds",
                            description = "You don't have enough to buy this, you have: "..balance.."$",
                            icon = "hand"
                        })
                    else
                        lib.notify({
                            type = "success",
                            title = "Bought a car",
                            description = "Bought a car, left with ".. balance-2000 .. "$"
                        })
                        SenderID = PlayerId()
                        TriggerServerEvent("MoneyAndJobs:buy", SenderID, balance-2000, "")
                        CarModelHash = `club`
                        RequestModel(CarModelHash)
                        while not HasModelLoaded(CarModelHash) do
                            Wait(0)
                        end
                        PlayerPed = PlayerPedId()
                        Vehicle = CreateVehicle(CarModelHash, GetEntityCoords(PlayerPed), GetEntityHeading(PlayerPed), true, false)
                        SetModelAsNoLongerNeeded(CarModelHash)
                        Wait(500)
                        TaskWarpPedIntoVehicle(PlayerPed, Vehicle, -1)
                    end
                end)
            end
        }
    }})
    lib.showContext("shop")
end)

RegisterKeyMapping("MoneyAndJobs:shop", "Open the shop", "keyboard", "M")