Citizen.CreateThread(function()
    MySQL.Async.store('SELECT `health` FROM `users` WHERE `identifier` = ?', function(storeId) LoadHealthQuery = storeId end)
    MySQL.Async.store("UPDATE `users` SET `health` = ? WHERE `identifier` = ?", function(storeId) UpdateHealthQuery = storeId end)
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function() -- load
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer ~= nil then
        MySQL.Async.fetchAll(LoadHealthQuery, {xPlayer.identifier}, function(data)
            if data[1].health ~= nil then
                TriggerClientEvent('sv_player:setHealth', playerId, data[1].health)
            end
        end)
    end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason) -- update
	local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer ~= nil then
        local health = GetEntityHealth(GetPlayerPed(xPlayer.source))
        MySQL.Async.execute(UpdateHealthQuery, {health, xPlayer.identifier})
	  end
end)
