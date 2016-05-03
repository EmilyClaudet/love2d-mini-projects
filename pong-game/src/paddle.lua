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

-- update paddle 1
function update_paddle1(dt)
	-- paddle1 controls
	if love.keyboard.isDown('w') then 
		paddle1_y = paddle1_y - (paddle1_speed * (dt))
	end

	if love.keyboard.isDown('s') then 
		paddle1_y = paddle1_y + (paddle1_speed * (dt))
	end

	-- stop paddle1 from going off edge of screen
	if paddle1_y < 0 then
		paddle1_y = 0
	elseif (paddle1_y + paddle1_h) > screen_height then
		paddle1_y = screen_height - paddle1_h
	end
end

-- update paddle2
function update_paddle2(dt)
	-- paddle2 controls
	if love.keyboard.isDown('up') then 
		paddle2_y = paddle2_y - (paddle2_speed * (dt))
	end

	if love.keyboard.isDown('down') then 
		paddle2_y = paddle2_y + (paddle2_speed * (dt))
	end

	-- stop paddle2 from going off edge of screen
	if paddle2_y < 0 then
		paddle2_y = 0
	elseif (paddle2_y + paddle2_h) > screen_height then
		paddle2_y = screen_height - paddle2_h
	end
end

function draw_paddle1()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', paddle1_x, paddle1_y, paddle1_w, paddle1_h)
end

function draw_paddle2()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', paddle2_x, paddle2_y, paddle2_w, paddle2_h)
end
