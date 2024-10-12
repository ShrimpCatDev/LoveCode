function setup(sW,sH,winW,winH,path)
    push=require(path)
    love.graphics.setDefaultFilter('nearest', 'nearest') 
    local gW,gH=sW,sH
    local wW,wH=winW,winH
    push:setupScreen(gW,gH,wW,wH,{fullscreen = false, resizable = true})
end

function animateSpritesheet(ani,spd)
    return ani[1+math.floor(spd*love.timer.getTime()%#ani)]
end

function newspritesheet(path,w,h,output)
    for y=0,path:getHeight()/h do
        for x=0,path:getWidth()/w do
            local quad=love.graphics.newQuad( x*w, y*h, w, h, path:getWidth(), path:getHeight() )
            table.insert(output,quad)
        end
    end
end

function love.resize(w, h)
    return push:resize(w, h)
end

function lerp(a, b, t)
    return a + (b - a) * t
  end

function col(x1,y1,x2,y2,w1,h1,w2,h2)
    if x1<x2+w2 then
        if x2<x1+w1 then
            if y1<y2+h2 then
                if y2<y1+h1 then
                    return(true)
                end
            end
        end
    end
end