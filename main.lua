function love.load()
    require("lib/function")
    require("configs")
    sti = require 'lib/sti'

    setup(gameW,gameH,windowW,windowH,"lib/push")
    love.window.setTitle(windowTitle)

    require("mcAPI")
    require("code")
    timeEEE=0
    
    gameStart()
    SystemFont=love.graphics.newImageFont("assets/font.png",[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890!@#$%^&*(){}[]"'?/+-,.:;~`\|🙂🙁]] ,1)
    love.graphics.setFont(SystemFont)
end

function love.update(dt)
    gameUpdate(dt)
    timeEEE=timeEEE+1
end

local t=0
function love.draw()
    
    push:start()
    love.graphics.clear()
    if bgimg~= nil then love.graphics.draw(bgimg,0,0) end
    gameDraw()
    push:finish()

end

function love.keypressed(k)
    buttonPressed(k)
end