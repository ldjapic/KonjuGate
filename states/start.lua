-- GAME START SCENE

-- A table which is contain all stuff of related to this state not only functions
local start = state:new()


function start:update(dt)
  if love.mouse.isDown(1) then
    changeStateTo('game')
  end
end

function start:draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("click to play",320,240)
end

return start