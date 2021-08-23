local UpdateHealthNArmour = function()
  local playerPed = PlayerPedId()
  TriggerServerEvent('esx_healthnarmour:update', GetEntityHealth(playerPed), GetPedArmour(playerPed))
end

RegisterNetEvent('esx_healthnarmour:set')
AddEventHandler('esx_healthnarmour:set', function(health, armour)
  local playerPed = PlayerPedId()
  SetEntityHealth(playerPed, health)
  SetPedArmour(playerPed, armour)
end)

RegisterNetEvent('esx_healthnarmour:save')
AddEventHandler('esx_healthnarmour:save', function()
  UpdateHealthNArmour()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function(playerId)
  UpdateHealthNArmour()
end)