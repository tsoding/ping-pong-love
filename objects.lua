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

return objects
