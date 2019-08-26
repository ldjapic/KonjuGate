local state = {}

function state:enter()
    -- call it when we enter this state
end

function state:leave()
    -- call it when we enter this state
end

---------

function state:update(dt)
    if love.keyboard.isDown( 'space' ) then
        currentState = "game"
    end
end

function state:draw()
    love.graphics.print("push space to start", 0, 40)
end
  
return state