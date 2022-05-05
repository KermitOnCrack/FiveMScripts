local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback('admin:aduty', function (scource,cb)
    local xPlayer=ESX.GetPlayerFromId(scource)
    cb(xPlayer.getGroup())
end)