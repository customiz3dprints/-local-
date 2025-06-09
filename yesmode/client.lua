RegisterCommand("test", function (_,args)
    local modelHash = GetHashKey('csb_stripper_02')
    if not IsModelAPed(modelHash) then
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                multiline = true,
                args = {'[Server]', 'Model not found!'}
            })
        end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
    end
    local pID = PlayerId()
    SetPlayerModel(pID, 'csb_stripper_02')
    SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
end)
RegisterCommand("igen", function (_, args)
    Isdrawables = GetNumberOfPedTextureVariations(PlayerPedId(), args[1], 0)
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'[Server]', 'Textures: ' .. Isdrawables}
    })
    
end)
-- FiveM Lua Script to Get Ped Model Components and Send to Chat

-- Function to get the drawable variations and textures for a ped model
function GetPedComponents(pedModel)
    local components = {}

    for componentId = 0, 11 do -- Ped components range from 0 to 11
        local drawableCount = GetNumberOfPedDrawableVariations(pedModel, componentId)
        components[componentId] = {}

        for drawableId = 0, drawableCount - 1 do
            local textureCount = GetNumberOfPedTextureVariations(pedModel, componentId, drawableId)
            table.insert(components[componentId], {
                drawable = drawableId,
                textures = textureCount
            })
        end
    end

    return components
end

-- Function to get the prop variations for a ped model
function GetPedProps(pedModel)
    local props = {}

    for propId = 0, 7 do -- Ped props range from 0 to 7
        local propCount = GetNumberOfPedPropDrawableVariations(pedModel, propId)
        if propCount > 0 then
            props[propId] = {}

            for propIndex = 0, propCount - 1 do
                local textureCount = GetNumberOfPedPropTextureVariations(pedModel, propId, propIndex)
                table.insert(props[propId], {
                    prop = propIndex,
                    textures = textureCount
                })
            end
        end
    end

    return props
end

-- Main script logic
RegisterCommand("getpedcomponents", function(source, args, rawCommand)
    local ped = PlayerPedId() -- Get the player's ped
    local pedModel = GetEntityModel(ped) -- Get the ped model hash

    TriggerEvent("chat:addMessage", {
        color = {255, 255, 0},
        multiline = true,
        args = {"Ped Info", "Ped Model: " .. pedModel}
    })

    local components = GetPedComponents(pedModel)
    local props = GetPedProps(pedModel)

    -- Send components to chat
    for componentId, drawables in pairs(components) do
        local message = "Component ID: " .. componentId .. " | Drawables: "
        for _, drawableData in ipairs(drawables) do
            message = message .. "[Drawable: " .. drawableData.drawable .. ", Textures: " .. drawableData.textures .. "] "
        end
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 0},
            multiline = true,
            args = {"Ped Component", message}
        })
    end

    -- Send props to chat or notify if none
    local propsFound = false
    for propId, propsData in pairs(props) do
        propsFound = true
        local message = "Prop ID: " .. propId .. " | Props: "
        for _, propData in ipairs(propsData) do
            message = message .. "[Prop: " .. propData.prop .. ", Textures: " .. propData.textures .. "] "
        end
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 255},
            multiline = true,
            args = {"Ped Prop", message}
        })
    end

    if not propsFound then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            multiline = true,
            args = {"Ped Prop", "This model has no props."}
        })
    end
end, false)
