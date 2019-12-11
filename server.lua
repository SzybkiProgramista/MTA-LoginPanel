
local function getWindowPosition(w, h)
    local screenWidth, screenHeight = guiGetScreenSize()
    local x = (screenWidth / 2) - (w / 2)
    local y = (screenHeight / 2) - (h / 2)

    return x, y, w, h
end    

addEvent('loginPanel:open', true)
addEventHandler('loginPanel:open', root, function() 
    setCameraMatrix(0, 0, 100, 0, 100, 50)
    fadeCamera(true)

    showCursor(true, true)

    guiSetInputMode('no_binds')

    local x, y, w, h - getWindowPosition(400, 230)
    local window = guiCreateWindow(x, y, w, h, 'Login Panel to Our server', false)

    local usernameLabel = guiCreateLabel(15, 30, width - 30, 20, 'Uername: ', false, window)
    local usernameInput = guiCreateEdit(10, 50, width - 20, 30, '', false, window)
    
    local passwordLabel = guiCreateLabel(15, 90, w - 30, 20, 'Password: ', false, window)
    local passwordInput = guiCreateEdit(10, 110, w - 20, 30, '', false, window)

    local registerButton = guiCreateButton(10, 190, (width / 2) - 15, 30, 'Sing Up', false, window)

    local loginButton = guiCreateButton(10, 150, w - 20, 30, 'Login', false, window)

    local forgotPasswordButton = guiCreateButton((width / 2) + 5, 190, (width / 2) - 15, 30, 'Forgot password', false, window) 

end, true)

triggerEvent('loginPanel:open', localPlayer)