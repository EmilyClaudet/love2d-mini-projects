local STI = require "libs.STI"
local playerX = 0
local playerY = 550
local speed = 200
local playerY_velocity = 0
local gravity = 500
local jump_height = 400


function love.load()
	map = STI.new("res/maps/map.lua")
	player = love.graphics.newImage("res/images/jumper.png")
	music = love.audio.newSource("res/audio/cheery.wav")
	jump_sound = love.audio.newSource("res/audio/jump.wav")
end

function love.draw()
	-- Draw map
	map:draw()
	-- Draw player
	love.graphics.draw(player, playerX, playerY, 0)
	-- Play music
	music:play()
end

function love.update(dt)
	if love.keyboard.isDown('left') then
		playerX = playerX - (speed * dt)
	end
	if love.keyboard.isDown('right') then
		playerX = playerX + (speed * dt)
	end

	if playerY_velocity ~= 0 then -- We're probably jumping
    playerY = playerY + (playerY_velocity * dt) -- "dt" means we wont move at different speeds if the game lags
    playerY_velocity = playerY_velocity - gravity * dt
 
    if playerY < 550 then -- We hit the ground again
      playerY_velocity = 0
      playerY = 550
    end
  end

	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then
    if playerY_velocity == 0 then -- We're probably on the ground, let's jump
      playerY_velocity = jump_height
    end
    jump_sound:play()
  end
end

function love.quit()
	print('Quitting platformer...')
end
