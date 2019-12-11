addEventHandler('onPlayerJoin', root, function () 
    triggerClientEvent(source, 'loginPanel:open', source)
end)