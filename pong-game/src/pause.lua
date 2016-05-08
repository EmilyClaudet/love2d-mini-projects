function load_score()
	score1 = 0
	score2 = 0
	win_sound = love.audio.newSource("res/win.wav")
end


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
	paused = "PAUSED"
	love.graphics.setColor(0, 0, 0, 150)
	love.graphics.rectangle('fill', 0, 0, screen_width, screen_height)
	love.graphics.print(paused, (screen_width / 2), (screen_height / 2), 0, 2, 2)
end

function player1_wins()
	if score1 == 5 then
		state = 'end1'
	end
end

function player2_wins()
	if score2 == 5 then
		state = 'end2'
	end
end

function draw_end_screen1()
	endgame = "PLAYER 1 WINS!"
	love.graphics.setColor(0, 0, 0, 150)
	love.graphics.rectangle('fill', 0, 0, screen_width, screen_height)
	love.graphics.print(endgame, (screen_width / 2), (screen_height / 2), 0, 2, 2)
	win_sound:play()
end

function draw_end_screen2()
	endgame = "PLAYER 2 WINS!"
	love.graphics.setColor(0, 0, 0, 150)
	love.graphics.rectangle('fill', 0, 0, screen_width, screen_height)
	love.graphics.print(endgame, (screen_width / 2), (screen_height / 2), 0, 2, 2)
	win_sound:play()
end