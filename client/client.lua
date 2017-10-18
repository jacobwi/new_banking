--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX                         = nil
inMenu                      = false

--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

--===============================================
--==             Core Threading                ==
--===============================================
Citizen.CreateThread(function()
  while true do
    Wait(0)
		
    if IsControlJustPressed(1, 140) then
	  inMenu = true
      SetNuiFocus(true, true)
      SendNUIMessage({type = 'openGeneral'})
      local ped = GetPlayerPed(-1)
	  		
    end
        
    if IsControlJustPressed(1, 322) then
	  inMenu = false
      SetNuiFocus(false, false)
      SendNUIMessage({type = 'close'})
    end
  end
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'closeAll'})
end)