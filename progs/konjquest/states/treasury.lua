local state = {}

print("polished the treasures")

function state:enter()
    -- call it when we enter this state
end

function state:leave()
    -- call it when we enter this state
end

---------

function state:update(dt)
    if love.keyboard.isDown( 'space' ) then
        exitToKonjugate()
    end
end

function state:draw()
    love.graphics.print("you are in the treasury. Push space to exit to KonjuGate.", 0, 40)
end
  
return state