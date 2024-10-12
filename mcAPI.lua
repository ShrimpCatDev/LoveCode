--MakeCode Arcade API

function newSprite(var,im, ty,wi,he)
    table.insert(var,{

        img = love.graphics.newImage(im),
        type = ty,
        x = math.floor(push:getWidth()/2),
        y = math.floor(push:getHeight()/2),
        vx=0,
        vy=0,
        mwb=false,
        mvx=0,
        mvy=0,
        accx=0,
        accy=0,
        w=0,
        h=0

    })
    local ww = wi or var[#var].img:getWidth()
    local hh = he or var[#var].img:getHeight()
    var[#var].w=ww
    var[#var].h=hh
end

function deleteSprite(var,num)
    table.remove(var,num or #var)
end

function drawSprites(var)
    for k,s in pairs(var) do
        love.graphics.draw(s.img,s.x,s.y)
    end
end

function updateSprites(var)
    for k,s in pairs(var) do

        s.y=s.y+s.vy
        s.x=s.x+s.vx
        s.vy=s.vy+s.accy
        s.vx=s.vx+s.accx

        if love.keyboard.isDown(input.up) then
            s.y=s.y-s.mvy
        end

        if love.keyboard.isDown(input.down) then
            s.y=s.y+s.mvy
        end

        if love.keyboard.isDown(input.left) then
            s.x=s.x-s.mvx
        end

        if love.keyboard.isDown(input.right) then
            s.x=s.x+s.mvx
        end

    end
end

function moveSpriteWithButtons(var,vx,vy,index)
    var[index or #var].mwb=true
    var[index or #var].mvx=vx
    var[index or #var].mvy=vy
end

function setSpritePosition(var,x,y,index)
    var[index or #var].x=x
    var[index or #var].y=y
end

function setSpriteVelocity(var,x,y,ind)
    var[ind or #var].vx=x
    var[ind or #var].vy=y
end

function setSpriteAcceleration(var,x,y,index)
    var[index or #var].accx=x
    var[index or #var].accy=y
end

function setSpritePositionX(var,x,index)
    var[index or #var].x=x
end

function setSpritePositionY(var,x,index)
    var[index or #var].y=x
end

function getSpritePositionX(var,x,index)
    return var[index or #var].x
end

function getSpritePositionY(var,x,index)
    return var[index or #var].y
end

function newImage(path)
    return love.graphics.newImage(path)
end

bgimg=nil
function setBackgroundImage(image)
    bgimg=image
end

function all(t)
    return pairs(t)
end

function spritesAreColliding(s1,s2)
    col(s1.x,s1.y,s2.x,s2.y,s1.w,s1.h,s2.w,s2.h)
end
function keyPressed(k)
    return love.keyboard.isDown(k)
end