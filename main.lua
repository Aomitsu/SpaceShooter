if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local boundary_top = require('entities/boundary/top')
local world = require('world')


function love.load()
    Object = require "libs/classic"
    require "entities/player"
    require "entities/enemy1"

    world = love.physics.newWorld(0, 0, true)

    player = Player()
    enemy1 = Enemy1()
    love.window.setVSync( 0 )
end

function love.update(dt)
    world:update(dt)
    player:update(dt)
    enemy1:update(dt)
end

function love.draw()
    player:draw()
    enemy1:draw()
    love.graphics.polygon('line', boundary_top.body:getWorldPoints(boundary_top.shape:getPoints()))
    love.graphics.print({{0, 255, 0, 255}, "Debug"}, 10, 10)
    love.graphics.print({{0, 255, 0, 255}, "FPS: "..tostring(1.0 / love.timer.getDelta()).." / "..tostring(love.timer.getFPS())}, 10, 25)
end