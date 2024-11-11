function gameStart()
    math.randomseed(love.math.random(0,99999))
    Player={}
    newSprite(Player,"assets/sprites/duck.png","player")
    moveSpriteWithButtons(Player,1,1)

    Block={}
    
    for i=0,9 do
    newSprite(Block,"assets/sprites/block.png","bloack")
    setSpritePosition(Block,math.random(0,152),math.random(0,112))
    end

    map=newMap("assets/tilemaps/testMap.lua")
    setupMap(map)
end

function gameUpdate(dt)
    updateSprites(Player)
    updateSprites(Block)
    map:update(dt)
end

function gameDraw()
    drawSprites(Block)
    map:draw()
    drawSprites(Player)
end

function buttonPressed(button)

end
