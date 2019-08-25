-- A state metatable
state = {}

function state:new()
  local newState = {}
  
  newState.isPaused = false;
  
  setmetatable(newState, self)
  self.__index = self
  return newState
end

function state:load()
  -- load assetes for state or set variables of state
  -- called inside  love.load
end

function state:update(dt)
  -- updating state elements
  -- called inside love.update function
end

function state:draw()
  -- drawing state elements
	-- called inside love.draw
end

function state:reset()
  -- call it when state have to reset
end

return state