local game = state:new()

function game:load()

  -- circle's perameters
  -- that are stored in game table so we can use it anywhere with self presfix
  self.x = 320
  self.y = 420
  self.r = 50
  self.life = 1

end

function game:update(dt)
  --changing circle position
  self.x, self.y = love.mouse.getPosition()

  -- decresing life spam :-|
  self.life = self.life - dt/5

  -- if player die change state
  if self.life < 0 then
    changeStateTo('gameover')
  end

end


function game:draw()
  --set players color
  love.graphics.setColor(1,1,1,self.life)
  -- draw player
  love.graphics.circle('fill', self.x, self.y, self.r)
  love.graphics.print(self.life,320,240)

end

function game:reset()
  -- if game is restarted bring back life to player
  self.life = 1;
end

return game
