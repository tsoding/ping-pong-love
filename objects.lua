local vectors = require('vectors')
local Vec2d = vectors.Vec2d

local objects = {}

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
