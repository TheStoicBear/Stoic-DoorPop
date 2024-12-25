
-- client.lua
local specificVehicle = nil

RegisterCommand('setpop', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle and vehicle ~= 0 then
        specificVehicle = vehicle
        if Config.DebugMode then
            print("Vehicle set for door popping: " .. tostring(vehicle))
        end
        TriggerEvent('chat:addMessage', {
            args = { 'Vehicle door popping set!' }
        })
    else
        TriggerEvent('chat:addMessage', {
            args = { 'You are not in a vehicle!' }
        })
    end
end, false)

RegisterCommand('opencar', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if specificVehicle and specificVehicle ~= 0 and vehicle == specificVehicle then
        local doorIndex = 0 -- Driver's side front door
        local isDoorOpen = GetVehicleDoorAngleRatio(specificVehicle, doorIndex) > 0

        if isDoorOpen then
            SetVehicleDoorShut(specificVehicle, doorIndex, false)
        else
            SetVehicleDoorOpen(specificVehicle, doorIndex, false, false)
        end

        if Config.DebugMode then
            print("Toggled door state for vehicle: " .. tostring(specificVehicle))
        end
    else
        TriggerEvent('chat:addMessage', {
            args = { 'No specific vehicle set or you are not in the correct vehicle!' }
        })
    end
end, false)

-- Keybind for toggling the door
RegisterKeyMapping('opencar', 'Toggle Car Door', 'keyboard', 'F1')
