function love.keypressed(key)
	if key == 'q' then
		love.event.push('q')
	end
	if key == 'space' then
		if state == 'play' then
			state = 'pause'
		else
			state = 'play'
		end
	end
end

function draw_pause_screen()
	love.graphics.setColor(0, 0, 0, 150)
	love.graphics.rectangle('fill', 0, 0, screen_width, screen_height)
	love.graphics.print('PAUSED', (screen_width / 2), (screen_height / 2), 0, 2, 2)
end
