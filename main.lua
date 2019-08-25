state = require "state"
states = {}
currentState = null;

function love.load(arg)
  local files = love.filesystem.getDirectoryItems( 'states/' );

    for k, file in ipairs(files) do
        sname = string.gsub(file,'.lua','')
        states[sname] = require ('states/'..sname)
        print('loading State '..sname)
        states[sname]:load()
    end

    changeStateTo('start')
end

function love.update(dt)
  if not states[ currentState ].isPaused then
    states[ currentState ]:update(dt)
  end

  if  love.keyboard.isDown( 'space' ) and not pressed then
    states[ currentState ].isPaused = not states[ currentState ].isPaused
  end
  
  pressed = love.keyboard.isDown( 'space' )
end

function love.draw()
  states[ currentState ]:draw()
end


function changeStateTo(state_)
  currentState = state_
  states[ currentState ]:reset()
end