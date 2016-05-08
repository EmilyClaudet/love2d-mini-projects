require 'paddle'
require 'ball'
require 'pause'

function love.load()
    screen_width = 500
    screen_height = 300
    background_color = {39, 160, 160, 0}
    love.window.setTitle('Emily\'s PONG GAME')
    love.window.setMode(screen_width, screen_height)
    music = love.audio.newSource("res/arcadetune.wav")
    load_paddle1()
	load_paddle2()
	load_ball()
	load_score()

	state = 'play'
end

function love.update(dt)
	if state ~= 'play' then
		return 
	end
	update_paddle1(dt)
	update_paddle2(dt)
	bounce_ball_off_walls()
	reset_ball_if_offscreen()
	bounce_ball_off_paddle1()
	bounce_ball_off_paddle2()
	update_ball(dt)
	player1_wins()
	player2_wins()
	-- quit game with ESC
	love.quit()
end

function love.draw()
	love.graphics.setBackgroundColor(background_color)
	draw_paddle1()
	draw_paddle2()
	draw_ball()
	draw_score()
	music:play()
	-- pause the game
	if state == 'pause' then
		draw_pause_screen()
		love.audio.pause(music)
	end
	if state == 'end1' then 
		draw_end_screen1()
		love.audio.pause(music)
	end
	if state == 'end2' then 
		draw_end_screen2()
		love.audio.pause(music)
	end
end

function love.quit()
	if love.keyboard.isDown('escape') then
		print('Quitting Pong...')
		love.event.quit()
	end
end
