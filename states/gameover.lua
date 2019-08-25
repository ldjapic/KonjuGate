local gameover = state:new()

function gameover:update()

  -- Going back to game state
  -- this will first reset game state
  if love.mouse.isDown(1) then
    changeStateTo('game')
  end
end

function gameover:draw()

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("Game Over",300,200)
  love.graphics.print("Click to restart",280,240)
end

return gameover