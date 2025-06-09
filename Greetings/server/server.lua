RegisterCommand('SetGreet', function (source, args, rawCommand)
    local CLientLicense = GetPlayerIdentifierByType(source, 'license')
    local greetText = string.sub(rawCommand, 10 )

    MySQL.insert('INSERT INTO greets (Id, GreetText) VALUES (?, ?) ON DUPLICATE KEY UPDATE GreetText = ?', {
        CLientLicense,
        greetText,
        greetText,
    }, function ()
        TriggerClientEvent("chat:addMessage", source, {
            args = "Your greeting has been saved!"
        })
    end)
end)
RegisterNetEvent('Greetings:greet', function ()
    local playerID = source
    local CLientLicense = GetPlayerIdentifierByType(source, 'license')
    MySQL.scalar('SELECT GreetText FROM greets WHERE ID = ?', {
            CLientLicense
    }, function (result)
        if not result then return end
        TriggerClientEvent("chat:addMessage", playerID, {
            args = {result}
        })
    end)
end)