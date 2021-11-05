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
}

RegisterServerEvent("qb-recycle:server:getItem")
AddEventHandler("qb-recycle:server:getItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i = 1, math.random(2, 4), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        local amount = math.random(10, 25)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Citizen.Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 7 then
        Player.Functions.AddItem("cashroll", 5, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cashroll"], "add")
    end

    local Luck = math.random(1, 10)
    local Odd = math.random(1, 10)
    if Luck == Odd then
        local random = math.random(5, 10)
        Player.Functions.AddItem("electronics", random)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["electronics"], 'add')
    end
end)
