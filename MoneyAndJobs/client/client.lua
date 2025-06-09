RegisterCommand("GetBalance", function ()
    TriggerServerEvent("MoneyAndJobs:balance")
end)
RegisterCommand("AddToBalance", function (source, args, rawCommand)
    SenderID = PlayerPedId()
    TriggerServerEvent("MoneyAndJobs:add", SenderID, args, rawCommand)
end)
RegisterCommand("TakeFromBalance", function (source, args, rawCommand)
    SenderID = PlayerPedId()
    TriggerServerEvent("MoneyAndJobs:remove", SenderID, args, rawCommand)
end)
RegisterCommand("SetBalance", function (source, args, rawCommand)
    SenderID = PlayerPedId()
    TriggerServerEvent("MoneyAndJobs:set", SenderID, args, rawCommand)
end)
CreateThread(function ()
    while true do
        Wait(1000)
        TriggerServerEvent("MoneyAndJobs:GetMoneyNUI")
    end
end)
RegisterNetEvent("MoneyAndJobs:updateMoney", function(moneyVal)
    SendNuiMessage(json.encode({
        Type = "money",
        Value = moneyVal
    }))
end)