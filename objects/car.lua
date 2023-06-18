local Vector = require 'vector'

local Car = Object:extend()

function Car:new(world, x, y)
  self.position = Vector(x, y)

  self.speed = 100
end

function Car:update(dt)
end

function Car:draw()
end

return Car
