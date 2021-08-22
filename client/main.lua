Citizen.CreateThread(function()
  while true do
    local playerPed = PlayerPedId()
    TriggerServerEvent('esx_healthnarmour:update', GetEntityHealth(playerPed), GetPedArmour(playerPed))
    Citizen.Wait(1000)
  end
end)

RegisterNetEvent('esx_healthnarmour:set')
AddEventHandler('esx_healthnarmour:set', function(health, armour)
  local playerPed = PlayerPedId()
  SetEntityHealth(playerPed, health)
  SetPedArmour(playerPed, armour)
end)
