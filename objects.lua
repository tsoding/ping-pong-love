local vectors = require('vectors')
local Vec2d = vectors.Vec2d

local objects = {}

objects.Ball = {
   radius = 20
}

function objects.Ball:new(position, velocity)
   local newBall = { position = position,
                     velocity = velocity }
   self.__index = self
   return setmetatable(newBall, self)
end

function objects.Ball:draw()
   love.graphics.setColor(150, 150, 150)
   love.graphics.circle("fill",
                        self.position.x,
                        self.position.y,
                        self.radius)
end

function objects.Ball:update(dt)
   if not (self.radius <= self.position.x and self.position.x < love.graphics.getWidth() - self.radius) then
      self.velocity.x = -self.velocity.x
   end

   if not (self.radius <= self.position.y and self.position.y < love.graphics.getHeight() - self.radius) then
      self.velocity.y = -self.velocity.y
   end

   self.position = self.position + self.velocity * dt
end

------------------------------

objects.Bar = {
   width = 10,
   velocityValue = 300
}

function objects.Bar:new(position, length, color)
   local newBar = { position = position,
                    velocity = Vec2d:new(0, 0),
                    length = length,
                    color = color }
   self.__index = self
   return setmetatable(newBar, self)
end

function objects.Bar:setController(controller)
   self.controller = controller
end

function objects.Bar:draw()
   love.graphics.setColor(self.color.r, self.color.g, self.color.b)
   love.graphics.rectangle("fill", self.position.x, self.position.y,
                           self.width, self.length)
end

function objects.Bar:update(dt)
   if self.controller then
      self.velocity = vectors.zero

      if self.controller.up() then
         self.velocity = self.velocity + vectors.up * self.velocityValue
      end

      if self.controller.down() then
         self.velocity = self.velocity + vectors.down * self.velocityValue
      end
   end

   self.position = self.position + self.velocity * dt
end

return objects
