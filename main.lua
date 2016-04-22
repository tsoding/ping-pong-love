local vectors = require("vectors")
local objects = require ("objects")
local Vec2d = vectors.Vec2d
local Ball = objects.Ball

function love.load()
   local position = Vec2d:new(100, 100)
   local velocity = Vec2d:new(1, 1):normalize() * 200

   ball = Ball:new(position, velocity)
end

function love.draw()
   ball:draw()
end

function love.update(dt)
   ball:update(dt)
end
