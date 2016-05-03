function love.load()
    screen_width = 500
    screen_height = 300
    background_color = {39, 120, 120, 0}
    love.window.setTitle('Emily\'s PONG GAME')
    love.window.setMode(screen_width, screen_height)
    music = love.audio.newSource("res/arcadetune.wav")

    -- set paddles and ball up
    load_paddle1()
	load_paddle2()
	load_ball()

	state = 'play'
end

function love.update(dt)
	if state ~= 'play' then
		return 
	end

	-- paddle1 controls
	if love.keyboard.isDown('w') then 
		paddle1_y = paddle1_y - (paddle1_speed * (dt))
	end

	if love.keyboard.isDown('s') then 
		paddle1_y = paddle1_y + (paddle1_speed * (dt))
	end

	-- paddle2 controls
	if love.keyboard.isDown('up') then 
		paddle2_y = paddle2_y - (paddle2_speed * (dt))
	end

	if love.keyboard.isDown('down') then 
		paddle2_y = paddle2_y + (paddle2_speed * (dt))
	end

	-- stop paddle1 from going off edge of screen
	if paddle1_y < 0 then
		paddle1_y = 0
	elseif (paddle1_y + paddle1_h) > screen_height then
		paddle1_y = screen_height - paddle1_h
	end

	-- stop paddle2 from going off edge of screen
	if paddle2_y < 0 then
		paddle2_y = 0
	elseif (paddle2_y + paddle2_h) > screen_height then
		paddle2_y = screen_height - paddle2_h
	end

	-- Ball bounces off wall
	if ball_y < 0 then
		ball_speed_y = math.abs(ball_speed_y)
	elseif (ball_y + ball_h) > screen_height then
		ball_speed_y = -math.abs(ball_speed_y)
	end

	-- Ball bounces off paddle1
	if ball_x <= paddle1_w and
		(ball_y + ball_h) >= paddle1_y and
		ball_y < (paddle1_y + paddle1_h)
	then
		ball_speed_x = math.abs(ball_speed_x)
	end

	-- Ball bounces off paddle2
	if (ball_x + ball_w) <= (screen_width - paddle2_w) and
		(ball_y + ball_h) >= paddle2_y and
		ball_y < (paddle2_y + paddle2_h)
	then
		ball_speed_x = -math.abs(ball_speed_x)
	end

	-- Ball goes off the edge if paddle1 misses, go back to centre
	if ball_x + ball_w < 0 or ball_x > screen_width then
		ball_x = (screen_width / 2) - (ball_w / 2)
		ball_y = (screen_height / 2) - (ball_h / 2)
		ball_speed_x = -200
		ball_speed_y = 200
	end

	-- ball moves
	ball_x = ball_x + (ball_speed_x * dt)
	ball_y = ball_y + (ball_speed_y * dt)

	-- quit game with ESC
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

function love.draw()
	-- draw background
	love.graphics.setBackgroundColor(background_color)
	draw_paddle1()
	draw_paddle2()
	draw_ball()
	music:play()
	-- pause the game
	if state == 'pause' then
		draw_pause_screen()
	end
end

function load_paddle1()
	paddle1_w = 20
	paddle1_h = 70
	paddle1_x = 0
	paddle1_y = (screen_height / 2 ) - (paddle1_h / 2)
	paddle1_speed = 400
end

function load_paddle2()
	paddle2_w = 20
	paddle2_h = 70
	paddle2_x = screen_width - paddle2_w
	paddle2_y = (screen_height / 2 ) - (paddle2_h / 2)
	paddle2_speed = 400
end

function load_ball()
	ball_w = 20
	ball_h = 20
	ball_x = (screen_width / 2) - (ball_w / 2 )
	ball_y = (screen_height / 2) - (ball_h / 2 )
	ball_speed_x = -200
	ball_speed_y = 200
end

function draw_paddle1()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', paddle1_x, paddle1_y, paddle1_w, paddle1_h)
end

function draw_paddle2()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', paddle2_x, paddle2_y, paddle2_w, paddle2_h)
end

function draw_ball()
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle('fill', ball_x, ball_y, ball_w, ball_h)
end

function draw_pause_screen()
	love.graphics.setColor(0, 0, 0, 100)
	love.graphics.rectangle('fill', 0, 0, screen_width, screen_height)
	love.graphics.print('PAUSED', (screen_width / 2), (screen_height / 2), 0, 2, 2)
end

function love.keypressed(key)
	if key == 'q' then
		love.event.push('q')
	end

	if key == 'p' then
		if state == 'play' then
			state = 'pause'
		else
			state = 'play'
		end
	end
end

function love.quit()
	print('Quitting Pong...')
end
