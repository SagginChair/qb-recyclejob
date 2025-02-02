local ItemTable = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
    "stone",
    "rubber",
    "fabric",
}

RegisterServerEvent("qb-recycle:server:getItem")
AddEventHandler("qb-recycle:server:getItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i = 1, math.random(2, 3), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        local amount = math.random(15, 30)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Citizen.Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 10 then
    local gcoins = math.random(2,4)
        Player.Functions.AddItem("goldcoins", gcoins, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldcoins"], "add")
    end

    local Luck = math.random(1, 15)
    local Odd = math.random(1, 15)
    if Luck == Odd then
        Player.Functions.AddItem("electronics", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["electronics"], 'add')
    end
end)
