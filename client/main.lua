local applied = nil

RegisterNetEvent('sv_player:setHealth')
AddEventHandler('sv_player:setHealth', function(health)
    local playerPed = PlayerPedId()
    if not applied then
        applied = true
        SetEntityHealth(playerPed, health)
    end
end)
