ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
  MySQL.Async.store('SELECT `health`, `armour` FROM `users` WHERE `identifier` = ?', function(storeId) LoadHealthNArmour = storeId end)
  MySQL.Async.store("UPDATE `users` SET `health` = ?, `armour` = ? WHERE `identifier` = ?", function(storeId) UpdateHealthNArmour = storeId end)
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
  local playerId = source
  local xPlayer = ESX.GetPlayerFromId(playerId)
  ESX.PlayerData = xPlayer
  MySQL.Async.fetchAll(LoadHealthNArmour, { 
    ESX.PlayerData.identifier
    }, function(data)
      if data[1].health ~= nil then
        TriggerClientEvent('esx_healthnarmour:set', playerId, data[1].health, data[1].armour)
      end
  end)
end)

RegisterNetEvent('esx_healthnarmour:update')
AddEventHandler('esx_healthnarmour:update', function(health, armour)
  if ESX.PlayerData.identifier ~= nil then
    MySQL.Async.execute(UpdateHealthNArmour, { 
        health,
        armour,
        ESX.PlayerData.identifier
      }
    )
  end
end)
