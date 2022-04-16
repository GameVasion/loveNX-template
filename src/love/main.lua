local _DEBUG = true

function love.load()    
    -- load libriries 
    baton = require "lib.baton"
	Gamestate = require "lib.gamestate"
    lume = require "lib.lume"
    Timer = require "lib.timer"
    lovesize = require "lib.lovesize"

    -- load modules
    graphics = require "modules.graphics"
    input = require "modules.input"
    
    -- load states
    stateName = require "states.templateState"

    love.window.setMode(1280, 720, {resizable=true, vsync=true})
    lovesize.set(1280, 720)

    Gamestate.switch(stateName)
    
end

function love.update(dt)
    input:update()
    graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
    Gamestate.update(dt)
    
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
end

function love.keypressed(key)
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
    elseif key == "escape" then
        love.event.quit()
    else
        Gamestate.keypressed(key)
    end
end

function love.resize(width, height)
	lovesize.resize(width, height)
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.draw()
    graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
	lovesize.begin()
        Gamestate.draw()

    lovesize.finish()
    graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
    
    if _DEBUG then
        love.graphics.print(
            "FPS: " .. tostring(love.timer.getFPS()) ..
			"\nLUA MEM USAGE (KB): " .. tostring(math.floor(collectgarbage("count"))) ..
			"\nGRAPHICS MEM USAGE (MB): " .. tostring(math.floor(love.graphics.getStats().texturememory / 1048576)) ..
            "\nMouse X: " .. tostring(love.mouse.getX()) ..
            "\nMouse Y: " .. tostring(love.mouse.getY())
        )
    end
    
end

function love.quit()

end
