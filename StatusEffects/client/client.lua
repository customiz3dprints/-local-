RegisterCommand("SetHunger", function (_,args)
    SendNuiMessage({
        type = "hunger",
        value = args[1]
    })
end)