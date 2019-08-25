--! file: rectangle.lua

--Lua turns this into: Object.extend(Object)
Rectangle = Object:extend()

function Rectangle:new(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.speed = 100
end

--Lua turns this into: Rectangle.update(self, dt)
function Rectangle:update(dt)
  self.x = self.x + self.speed * dt
end

--Lua turns this into: Rectangle.draw(self)
function Rectangle:draw()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end