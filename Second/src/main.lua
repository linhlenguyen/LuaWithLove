
--
background = { x = 0, y = 0, img = nil }
player = { x = 100, y = 300, img = nil, speed = 20 }
food = {}

function love.load(arg)
    player.img = love.graphics.newImage('../sprites/pig.png')
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	if love.keyboard.isDown('left','a') and player.x > 0 then
		player.x = player.x - (player.speed*dt)
	elseif love.keyboard.isDown('right','d')
    and (player.x + player.img:getWith()/2) < love.graphics.getWidth() then
		player.x = player.x + (player.speed*dt)
	end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
    love.graphics.draw(background.img, background.x, background.y)
end

function nothing()
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
     nothing()
   end
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
     nothing()
   end
end

function love.keypressed(key)
   --Is animating
   if key == 'b' then
      text = "b key was pressed."
   elseif key == 'a' then
      a_down = true
   end
end

function love.keyreleased(key)
   if key == 'b' then
      text = "b key was released."
   elseif key == 'a' then
      a_down = false
   end
end

function love.focus(f)
  if not f then
    print("Lost focus")
  else
    print("Gained focus")
  end
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end
