local vectors = {}

vectors.Vec2d = {}

function vectors.Vec2d:new(x, y)
   newVec2d = {x = x, y = y}
   self.__index = self
   return setmetatable(newVec2d, self)
end

function vectors.Vec2d:__add(otherVec2d)
   return vectors.Vec2d:new(self.x + otherVec2d.x,
                    self.y + otherVec2d.y)
end

function vectors.Vec2d:__mul(scalar)
   return vectors.Vec2d:new(self.x * scalar,
                    self.y * scalar)
end

function vectors.Vec2d:length()
   return math.sqrt(self.x * self.x + self.y * self.y)
end

function vectors.Vec2d:normalize()
   local l = self:length()
   return vectors.Vec2d:new(self.x / l, self.y / l)
end

-- Useful vectors
vectors.zero = vectors.Vec2d:new(0, 0)
vectors.up = vectors.Vec2d:new(0, -1)
vectors.down = vectors.Vec2d:new(0, 1)

return vectors
