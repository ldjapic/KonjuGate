platform = {}
player = {}

test = 0
indicatorPosition = 0

mainWindowProp = {}
mainWindowProp.width = 640
mainWindowProp.height = 480

menuWindowProp = {}
menuWindowProp.width = 250
menuWindowProp.height = 350

menuWindowProp.entryYOffset = 140
menuWindowProp.entryXOffset = 50

menuWindowProp.entryYSpacing = 50
menuWindowProp.indactorXOffset = 12
menuWindowProp.indactorYOffset = 2

function indicatorIncrement(oldPosition)
    newPosition = oldPosition + 1
    if newPosition > 3 then newPosition = 3 end
    return newPosition
end

function indicatorDecrement(oldPosition)
    newPosition = oldPosition - 1
    if newPosition < 0 then newPosition = 0 end
    return newPosition
end

function love.load()

  bkgd = love.graphics.newImage("/client/graphicResources/bgnd_img.png")
  bkgd:setWrap('repeat', 'clamp')

  blackSquare = love.graphics.newImage("/client/graphicResources/black.png")
  bkgd:setWrap('repeat', 'repeat')

  logo = love.graphics.newImage("/client/graphicResources/name.png")

  indicator = love.graphics.newImage("/client/graphicResources/arrowIndicator.png")

  bkgndQuad = love.graphics.newQuad(0, 0, mainWindowProp.width, mainWindowProp.height, mainWindowProp.width, mainWindowProp.height)
  blackSqurQuad = love.graphics.newQuad(0, 0, menuWindowProp.width, menuWindowProp.height, menuWindowProp.width, menuWindowProp.height)

  bigFont = love.graphics.newFont(20);
  lilFont = love.graphics.newFont(10);

  bgmusic = love.audio.newSource("/client/graphicResources/backBeat.ogg", "static")
  bgmusic:setLooping(true)
  bgmusic:play()

  love.window.setMode(mainWindowProp.width, mainWindowProp.height)
end

function love.update(dt)

  xOffset = test * mainWindowProp.width

  test = test + (dt / 50)
  if test > 1 then
    test = test -1
  end


  bkgndQuad:setViewport(xOffset, 0, mainWindowProp.width, mainWindowProp.height, mainWindowProp.width, mainWindowProp.height)


end

function love.keypressed( key, scancode, isrepeat )

    if key == 'down' and isrepeat == false then indicatorPosition = indicatorIncrement(indicatorPosition) end
    if key == 'up' and isrepeat == false then indicatorPosition = indicatorDecrement(indicatorPosition) end

end




function love.draw()



  love.graphics.draw(bkgd, bkgndQuad, 0, 0)
  love.graphics.draw(blackSquare, blackSqurQuad, (mainWindowProp.width - menuWindowProp.width )/2 , (mainWindowProp.height - menuWindowProp.height)/2)
  love.graphics.draw(logo, (mainWindowProp.width - menuWindowProp.width )/2 , (mainWindowProp.height - menuWindowProp.height)/2 )

  love.graphics.setFont(bigFont)
  love.graphics.print("Game 1", ( (mainWindowProp.width - menuWindowProp.width)/2 ) + menuWindowProp.entryYSpacing, ((mainWindowProp.height - menuWindowProp.height)/2) + menuWindowProp.entryYOffset )
  love.graphics.print("Game 2", ( (mainWindowProp.width - menuWindowProp.width)/2 ) + menuWindowProp.entryYSpacing, ((mainWindowProp.height - menuWindowProp.height)/2) + menuWindowProp.entryYOffset + menuWindowProp.entryYSpacing *1 )
  love.graphics.print("Game 3", ( (mainWindowProp.width - menuWindowProp.width)/2 ) + menuWindowProp.entryYSpacing, ((mainWindowProp.height - menuWindowProp.height)/2) + menuWindowProp.entryYOffset + menuWindowProp.entryYSpacing *2 )
  love.graphics.print("Quit", ( (mainWindowProp.width - menuWindowProp.width)/2 ) + menuWindowProp.entryYSpacing, ((mainWindowProp.height - menuWindowProp.height)/2) + menuWindowProp.entryYOffset + menuWindowProp.entryYSpacing *3 )

  love.graphics.draw(indicator, (mainWindowProp.width - menuWindowProp.width )/2  + menuWindowProp.indactorXOffset, (mainWindowProp.height - menuWindowProp.height)/2 + menuWindowProp.entryYOffset + menuWindowProp.indactorYOffset + (indicatorPosition * menuWindowProp.entryYSpacing) )



  love.graphics.setFont(lilFont)
  love.graphics.print(tostring(test))
end
