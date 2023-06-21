local Vector = Object:extend()

function Vector:new(x, y)
  self.x = x
  self.y = y
end

function Vector:__add(other)
  return Vector(self.x + other.x, self.y + other.y)
end

function Vector:__sub(other)
  return Vector(self.x - other.x, self.y - other.y)
end

function Vector:__mul(scale)
  return Vector(self.x * scale, self.y * scale)
end

function Vector:__div(scale)
  return Vector(self.x / scale, self.y / scale)
end

function Vector:__eq(other)
  return self.x == other.x and self.y == other.y
end

function Vector:__tostring()
  return "(" .. self.x .. ", " .. self.y .. ")"
end

function Vector:rotate(angle)
  local c, s = math.cos(angle), math.sin(angle)
  return Vector(c * self.x - s * self.y, s * self.x + c * self.y)
end

function Vector:splat()
  return self.x, self.y
end


return Vector
