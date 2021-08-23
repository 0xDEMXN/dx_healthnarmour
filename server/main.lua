ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
  MySQL.Async.store('SELECT `health`, `armour` FROM `users` WHERE `identifier` = ?', function(storeId) LoadHealthNArmour = storeId end)
  MySQL.Async.store("UPDATE `users` SET `health` = ?, `armour` = ? WHERE `identifier` = ?", function(storeId) UpdateHealthNArmour = storeId end)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
  ESX.PlayerData = xPlayer
  MySQL.Async.fetchAll(LoadHealthNArmour, { 
    ESX.PlayerData.identifier
    }, function(data)
      if (data[1].health ~= nil) then
        Citizen.Wait(1000)
        TriggerClientEvent('esx_healthnarmour:set', playerId, data[1].health, data[1].armour)
      end
  end)
end)

AddEventHandler('esx:onPlayerLogout', function(playerId)
  local xPlayer = ESX.GetPlayerFromId(source)
	if(xPlayer ~= nil) then
		TriggerClientEvent('esx_healthnarmour:save', playerId)
	end
end)

AddEventHandler('esx:playerDropped', function(playerId)
  local xPlayer = ESX.GetPlayerFromId(source)
	if(xPlayer ~= nil) then
		TriggerClientEvent('esx_healthnarmour:save', playerId)
	end
end)

AddEventHandler('esx_healthnarmour:update', function(health, armour)
  local xPlayer = ESX.GetPlayerFromId(source)
  if(xPlayer ~= nil) then
    MySQL.Async.execute(UpdateHealthNArmour,
      { 
        health,
        armour,
        xPlayer.identifier
      }
    )
  end
end)
