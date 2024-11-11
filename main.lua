function love.load()
    require("lib/function")
    require("configs")
    sti = require 'lib/sti'

    setup(gameW,gameH,windowW,windowH,"lib/push")
    love.window.setTitle(windowTitle)

    require("mcAPI")
    require("code")
    
    gameStart()
    camera={x=0,y=0}
end

function love.update(dt)
    gameUpdate(dt)
end

local t=0
function love.draw()
    
    push:start()
    love.graphics.clear()
    love.graphics.translate(-camera.x,-camera.y)
    if bgimg~= nil then love.graphics.draw(bgimg,0,0) end
    gameDraw()
    push:finish()

end

function love.keypressed(k)
    buttonPressed(k)
end