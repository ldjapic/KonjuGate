local state = {}
Object = require "classic"

local day = 0
local workstations = {}
local members = 0
local timefactor = 5

function state:update(dt)
  day = day + dt*timefactor
end

function state:draw()
  love.graphics.print("test",100,100)
end

function state:enter()
  -- if game is restarted bring back life to player
  day = 0
  workstations = {}
  members = 0
  timefactor = 5
end

return state
