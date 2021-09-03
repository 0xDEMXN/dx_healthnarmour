HealthNArmour = nil

RegisterNetEvent('esx_healthnarmour:set')
AddEventHandler('esx_healthnarmour:set', function(health, armour)
    local playerPed = PlayerPedId()
    if not HealthNArmour then
        HealthNArmour = true
        SetEntityHealth(playerPed, health)
        SetPedArmour(playerPed, armour)
    end
end)
