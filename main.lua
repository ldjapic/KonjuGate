

function love.draw()

  value = ("helloooo" == 0)

  muhstring = "Hello World " .. tostring(value);

    love.graphics.print(muhstring, 400, 300)
end
