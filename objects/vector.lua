local Vector = Object:extend()

function Vector:new(x, y)
  self.x = x
  self.y = y
end

return Vector
