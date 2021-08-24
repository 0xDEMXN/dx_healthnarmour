HealthNArmour = nil

Citizen.CreateThread(function()
  local sleep = 10000
  while true do
    if HealthNArmour then
      local playerPed = PlayerPedId()
      TriggerServerEvent('esx_healthnarmour:update', GetEntityHealth(playerPed), GetPedArmour(playerPed))
      sleep = 1000
    end
    Citizen.Wait(sleep)
  end
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
