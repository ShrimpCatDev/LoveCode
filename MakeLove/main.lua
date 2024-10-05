function love.load()
    require("lib/function")
    require("configs")

    setup(gameW,gameH,windowW,windowH,"lib/push")
    love.window.setTitle(windowTitle)

    require("mcAPI")
    require("code")
    
    gameStart()
end

function love.update()
    gameUpdate()
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