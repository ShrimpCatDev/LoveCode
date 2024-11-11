--MakeCode Arcade API
local bump = require 'lib/bump'
world = bump.newWorld(64)
local isUsingMap=false

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
        h=0,
        isSprite=true

    })
    local ww = wi or var[#var].img:getWidth()
    local hh = he or var[#var].img:getHeight()
    local tmpo=var[#var]
    if positionOffsetMode == "centered" then
        var[#var].x=push:getWidth()/2-tmpo.w/2
        var[#var].y=push:getHeight()/2-tmpo.h/2-tmpo.h/2
    end
    world:add(var[#var], var[#var].x,var[#var].y,ww,hh)
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

        s.vy=s.vy+s.accy
        s.vx=s.vx+s.accx

        if s.mvy~=0 then
            if love.keyboard.isDown(input.up) and not love.keyboard.isDown(input.down) then
                s.vy=-s.mvy
            elseif love.keyboard.isDown(input.down) and not love.keyboard.isDown(input.up) then
                s.vy=s.mvy
            else
                s.vy=0
            end
        end

        if s.mvx~=0 then
            if love.keyboard.isDown(input.left) and not love.keyboard.isDown(input.right) then
                s.vx=-s.mvx
            elseif love.keyboard.isDown(input.right) and not love.keyboard.isDown(input.left) then
                s.vx=s.mvx
            else
                s.vx=0
            end
        end
        local aX,aY,cols,len= world:move(s,s.x+s.vx,s.y+s.vy,filter)
        s.x,s.y=aX,aY

        for i=1,len do
            if cols[i].normal.y==-1 and s.accy>0 then
                s.vy=0
            elseif cols[i].normal.y==1 and s.accy<0 then
                s.vy=0
            elseif cols[i].normal.x==1 and s.accx<0 then
                s.vx=0
            elseif  cols[i].normal.x==-1 and s.accx>0 then
                s.vx=0
            else

            end
        end

    end
end

function moveSpriteWithButtons(var,vx,vy,index)
    var[index or #var].mwb=true
    var[index or #var].mvx=vx
    var[index or #var].mvy=vy
end

function setSpritePosition(var,x,y,index)
    local tempoo=var[index or #var]

    if positionOffsetMode=="centered" then
        var[index or #var].x=x-tempoo.w/2
        var[index or #var].y=y-tempoo.h/2
        world:update(var[index or #var], tempoo.x-tempoo.w/2,tempoo.y-tempoo.h/2)
    else
        var[index or #var].x=x
        var[index or #var].y=y
        world:update(var[index or #var], tempoo.x,tempoo.y)
   end
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

function filter(self,other)
    local kind=other.type

    if other.isSprite then
        if kind == "wall" then
            return "slide"
        else
            return "cross"
        end
    else
        return "slide"
    end
end

function newMap(path)
    isUsingMap=true
    return sti(path,{"bump"})
end

function setupMap(var)
    var:bump_init(world)
end

function getTile(layer,x,y,mapp)
    local tt=mapp:getTileProperties(layer,x+1,y+1)
    return tt.name
end

function setTile(layer,x,y,id,mapp)
    mapp:setLayerTile (layer, x, y, id)
end

function getWall(layer,x,y,mapp)
    local tt=mapp:getTileProperties(layer,x+1,y+1)
    if tt.collidable then
        return(true)
    end
end

function setCameraPosition(x,y)
    camera.x,camera.y=x,y
end
