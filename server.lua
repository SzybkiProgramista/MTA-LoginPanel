addEvent('loginPanel:auth', true)
addEventHandler('loginPanel:auth', root, function (username, password)
    local account = getAccount(username)

    if not account then return outputChatBox('Chuja') end

    --[[local hashedPassword = getAccountData(account,"hash_password")
    outputConsole('password ' ..password)
    local player = source
    if (passwordVerify(password, hashedPassword)) then
        return outputChatBox('No such account could be found with that username or password.', player, 255, 100, 100)
    end]]--
    if logIn(source, account, password) then
        spawnPlayer(source, 0, 0, 10)
        setCameraTarget(source, source)
        outputChatBox('Logowanie')
        --return triggerClientEvent(player, 'login-menu:close', player)
    else return outputChatBox('An unknown error occured while attempting to authenticate.', player, 255, 100, 100)
    end
end)