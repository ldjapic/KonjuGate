local state = {}

local getPrognames = function()
    return love.filesystem.getDirectoryItems( 'progs/' )
end

local prognames = getPrognames()

function state:enter()
    -- call it when we enter this state
end

function state:leave()
    -- call it when we enter this state
end

---------

function state:update(dt)
    if love.keyboard.isDown( '1' ) then
        loadProg(prognames[1])
    elseif love.keyboard.isDown( '2' ) then
        loadProg(prognames[2])
    end
end

function state:draw()
    local startpix = 40
    love.graphics.print("push number to select associated game"..currentState, 0, startpix)
    for k, progname in ipairs(prognames) do
        startpix = startpix + 12
        love.graphics.print(""..k..": "..progname, 0, startpix)
    end
end
  
return state