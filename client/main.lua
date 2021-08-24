HealthNArmour = nil

SetInterval(1, 0, function()
  if HealthNArmour then
      local playerPed = PlayerPedId()
      TriggerServerEvent('esx_healthnarmour:update', GetEntityHealth(playerPed), GetPedArmour(playerPed))
      SetInterval(1, 1000)
  else SetInterval(1, 10000) end
end)

RegisterNetEvent('esx_healthnarmour:set')
AddEventHandler('esx_healthnarmour:set', function(health, armour)
  local playerPed = PlayerPedId()
  if not HealthNArmour then
    SetEntityHealth(playerPed, health)
    SetPedArmour(playerPed, armour)
  end
  HealthNArmour = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
  HealthNArmour = false
end)
