local STI = require "libs.STI"
local playerX = 100
local playerY = 580
local speed = 200

function love.load()
	map = STI.new("res/maps/map.lua")

	player = love.graphics.newImage("res/images/jumper.png")

end

function love.draw()
	-- Draw map
	map:draw()
	-- Draw player
	love.graphics.draw(player, playerX, playerY, 0)
end

function love.update(dt)
	if love.keyboard.isDown('left') then
		playerX = playerX - (speed * dt)
	end
	if love.keyboard.isDown('right') then
		playerX = playerX + (speed * dt)
	end

	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

function love.quit()
	print('Ending game...')
end