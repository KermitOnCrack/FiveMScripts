ESX = nil
Citizen.CreateThread(function()
 while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
 end
end)

test=0
old1=0
old2=0

RegisterCommand('admin',function(scource, args, raw)
   ESX.TriggerServerCallback('admin:aduty',function(group)
       if group=='admin' then
           changeCloth(7,0)
       end
       if group=='superadmin' then
        changeCloth(7,1)
       end
       if group=='mod' then
        changeCloth(7,3)
       end
   end) 
end,false)


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function changeCloth(component1,component2)
            TriggerEvent('skinchanger:getSkin', function (skinData)
                if test==0 then
                    if skinData ~= nil then
                        old1 = skinData['bproof_1']
                        old2 = skinData['bproof_2']
                        skinData['bproof_1'] = component1
                        skinData['bproof_2'] = component2
                        TriggerEvent('skinchanger:loadSkin',skinData)
                        test=1
                    end
                else
                    if skinData ~= nil then
                        skinData['bproof_1'] = old1
                        skinData['bproof_2'] = old2 
                        TriggerEvent('skinchanger:loadSkin',skinData)
                        test=0
                    end
                end
            end)
end