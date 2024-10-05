function gameStart()
    mySprite={}
    newSprite(mySprite,"assets/duck.png", "player")
    moveSpriteWithButtons(mySprite,1,0)
    setSpriteAcceleration(mySprite,0,0.1)
    setSpritePosition(mySprite,160/2-8,120/2-8,i)
    setBackgroundImage(newImage("assets/bg1.png"))
end

function gameUpdate()
    updateSprites(mySprite)

    if getSpritePositionY(mySprite) >= 161 then
        setSpritePositionY(mySprite,-16)
    end
    if getSpritePositionY(mySprite) < -16 then
        setSpritePositionY(mySprite,160)
    end
end

function gameDraw()
    drawSprites(mySprite)
end

function buttonPressed(button)
    if button==input.buttonA then
        for i=1,#mySprite do
            setSpriteVelocity(mySprite,0,-2,i)
        end
    end
end