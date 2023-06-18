local Vector = require 'vector'

local Car = Object:extend()

function Car:new(world, x, y)
  self.position = Vector(x, y)
  self.speed = 100

  self.world = world
  self.body = love.physics.newBody(self.world, self.position.x, self.position.y, 'dynamic')
end

function Car:update(dt)
end

function Car:draw()
end

return Car
