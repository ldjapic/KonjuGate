states = nil
currentState = nil;

function changeStateTo(state_)
    if(currentState) then
        print('leaving state '..currentState)
        states[ currentState ]:leave()
    end

    currentState = state_
    print('entering state '..currentState)
    states[ currentState ]:enter()
end

function loadProg(progname)
    print('loading program '..progname)

    currentState = nil
    states = {}
    local files = love.filesystem.getDirectoryItems( 'progs/'..progname..'/states/' );

    for k, file in ipairs(files) do
        sname = string.gsub(file,'.lua','')
        print('initializing state '..sname)
        states[sname] = require ('progs/'..progname..'/states/'..sname)
    end

    changeStateTo('start')
end

function exitToKonjugate()
    loadProg("konjugate")
end

function love.load(arg)
    exitToKonjugate()
end

function love.update(dt)
    states[ currentState ]:update(dt)
end

function love.draw()
    states[ currentState ]:draw()
end
