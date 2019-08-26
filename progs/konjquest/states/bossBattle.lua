local state = {}

print("woke the boss monster")

function state:enter()
    -- call it when we enter this state
end

function state:leave()
    -- call it when we enter this state
end

---------

function state:update(dt)
    if not love.keyboard.isDown( 'space' ) then
        currentState = "treasury"
    end
end

function state:draw()
    love.graphics.print("you are in the boss room. Lift space to enter the treasury", 0, 40)
end
  
return state