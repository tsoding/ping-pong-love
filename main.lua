local vectors = require("vectors")
local objects = require ("objects")
local ball = require("ball")
local Vec2d = vectors.Vec2d
local Ball = ball.Ball
local Bar = objects.Bar

function trigger(keyName)
   return function()
      return love.keyboard.isDown(keyName)
   end
end

function love.load()
   gameObjects = {}

   local barPadding = 20

   local ballPosition = Vec2d:new(100, 100)
   local ballVelocity = Vec2d:new(1, 1):normalize() * 200

   local ball = Ball:new(ballPosition, ballVelocity)
   local barPlayer1 = Bar:new(Vec2d:new(barPadding, barPadding),
                              100, {r = 150, g = 20, b = 20})
   local barPlayer2 = Bar:new(Vec2d:new(love.graphics.getWidth() - barPadding - Bar.width, barPadding),
                              100, {r = 20, g = 150, b = 20})

   barPlayer1:setController({
         up = trigger('q'),
         down = trigger('a')
   })

   barPlayer2:setController({
         up = trigger('p'),
         down = trigger('l')
   })

   table.insert(gameObjects, ball)
   table.insert(gameObjects, barPlayer1)
   table.insert(gameObjects, barPlayer2)
end

function love.draw()
   for _, obj in ipairs(gameObjects) do
      obj:draw()
   end
end

function love.update(dt)
   for _, obj in ipairs(gameObjects) do
      obj:update(dt)
   end
end
