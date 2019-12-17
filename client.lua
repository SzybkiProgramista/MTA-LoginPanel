
local function getWindowPosition(w, h)
    local screenWidth, screenHeight = guiGetScreenSize()
    local x = (screenWidth / 2) - (w / 2)
    local y = (screenHeight / 2) - (h / 2)

    return x, y, w, h
end    

local function isUsernameValid(username) 
    return type(username) == 'string' and string.len(username) > 3 and string.len(username) < 16
end

local function isPasswordValid(password) 
    return type(password) == 'string' and string.len(password) > 5 and string.len(password) < 32
end

addEvent('loginPanel:open', true)
addEventHandler('loginPanel:open', root, function() 
    setCameraMatrix(0, 0, 100, 0, 100, 50)
    fadeCamera(true)

    showCursor(true, true)

    guiSetInputMode('no_binds')

    local x, y, width, height = getWindowPosition(400, 230)
    window = guiCreateWindow(x, y, width, height, 'Login to Our Server', false)
    guiWindowSetMovable(window, false)
    guiWindowSetSizable(window, false)

    local usernameLabel = guiCreateLabel(15, 30, width - 30, 20, 'Username: ', false, window)
    local usernameErrorLabel = guiCreateLabel(width - 200, 30, 200, 20, '', false, window)
    guiLabelSetColor(usernameErrorLabel, 255, 0, 0)
    guiSetVisible(usernameErrorLabel, false)
    local usernameInput = guiCreateEdit(10, 50, width - 20, 30, '', false, window)

    local passwordErrorLabel = guiCreateLabel(width - 200, 90, 200, 20, '', false, window)
    guiLabelSetColor(passwordErrorLabel, 255, 0, 0)
    guiSetVisible(passwordErrorLabel, false)

    local passwordLabel = guiCreateLabel(15, 90, width - 30, 20, 'Password: ', false, window)
    local passwordInput = guiCreateEdit(10, 110, width - 20, 30, '', false, window)
    guiEditSetMasked(passwordInput, true)

    local registerButton = guiCreateButton(10, 190, (width / 2) - 15, 30, 'Sing Up', false, window)

    local loginButton = guiCreateButton(10, 150, width - 20, 30, 'Login', false, window)
    addEventHandler('onClientGUIClick', loginButton, function (button, state)
        if button ~= 'left' or state ~= 'up' then
            return 
        end

        local username = guiGetText(usernameInput)
        local password = guiGetText(passwordInput)
        local inputValid = true

        if not isUsernameValid(username) then
            guiSetText(usernameErrorLabel, "Username is too short or too long.")
            guiSetVisible(usernameErrorLabel, true)
            inputValid = false
        else
            guiSetVisible(usernameErrorLabel, false)
            
        end

        if not isPasswordValid(password) then
            guiSetText(passwordErrorLabel, "Password is too short or too long.")
            guiSetVisible(passwordErrorLabel, true)
            inputValid = false
        else
            guiSetVisible(passwordErrorLabel, false)
        end

        if inputValid then
            
        end 

        triggerServerEvent('loginPanel:auth', localPlayer, username, password)
    

    end, false)

    local forgotPasswordButton = guiCreateButton((width / 2) + 5, 190, (width / 2) - 15, 30, 'Forgot password', false, window) 

end, true)

triggerEvent('loginPanel:open', localPlayer)