function load_ball()
	ball_w = 20
	ball_h = 20
	ball_x = (screen_width / 2) - (ball_w / 2 )
	ball_y = (screen_height / 2) - (ball_h / 2 )
	ball_speed_x = -200
	ball_speed_y = 200
	score_sound = love.audio.newSource("res/score.wav")
	wall_sound = love.audio.newSource("res/wall.wav")
	score1 = 0
	score2 = 0
end

function bounce_ball_off_walls()
	if ball_y < 0 then
		ball_speed_y = math.abs(ball_speed_y)
		wall_sound:play()
	elseif (ball_y + ball_h) > screen_height then
		ball_speed_y = -math.abs(ball_speed_y)
		wall_sound:play()
	end
end

function reset_ball_if_offscreen()	
	if ball_x + ball_w < 0 then
		ball_x = (screen_width / 2) - (ball_w / 2)
		ball_y = (screen_height / 2) - (ball_h / 2)
		ball_speed_x = -200
		ball_speed_y = 200
		score_sound:play()
		score2 = score2 + 1
	elseif ball_x > screen_width then
		ball_x = (screen_width / 2) - (ball_w / 2)
		ball_y = (screen_height / 2) - (ball_h / 2)
		ball_speed_x = 200
		ball_speed_y = 200
		score_sound:play()
		score1 = score1 + 1
	end
end

acc = 1.05

function bounce_ball_off_paddle1()
	if ball_x <= paddle1_w and
		(ball_y + ball_h) >= paddle1_y and
		ball_y < (paddle1_y + paddle1_h)
	then
		ball_speed_x = math.abs(ball_speed_x) * acc
		paddle1_sound:play()
	end
end

function bounce_ball_off_paddle2()
	if (ball_x + ball_w) >= (screen_width - paddle2_w) and
		(ball_y + ball_h) >= paddle2_y and
		ball_y < (paddle2_y + paddle2_h)
	then
		ball_speed_x = -math.abs(ball_speed_x) * acc
		paddle2_sound:play()
	end
end

function update_ball(dt)
	ball_x = ball_x + (ball_speed_x * dt)
	ball_y = ball_y + (ball_speed_y * dt)
end

function draw_ball()
	love.graphics.setColor(255, 150, 0)
	love.graphics.rectangle('fill', ball_x, ball_y, ball_w, ball_h)
end

function draw_score()
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(score1, 220, 10, 0, 2, 2)
	love.graphics.print(score2, 270, 10, 0, 2, 2)
end

