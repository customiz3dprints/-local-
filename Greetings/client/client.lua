AddEventHandler('playerSpawned', function ()
    TriggerServerEvent("Greetings:greet")
end)

RegisterCommand('testGreet', function ()
    TriggerServerEvent('Greetings:greet')
end)