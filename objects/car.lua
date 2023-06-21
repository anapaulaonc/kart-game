local Vector = require 'objects.vector'

local Car = Object:extend()

function Car:new(world, x, y)
  self.speed = 100
  self.angle = 0

  self.world = world
  self.body = love.physics.newBody(self.world, x, y, 'dynamic')
  self.body:setLinearDamping(4)

  self.sprite = love.graphics.newImage('sprites/car.png')
end

function Car:update(dt)
  local position = Vector(self.body:getPosition())

  if love.keyboard.isDown "a" then
    self.angle = self.angle - 1 * dt
  elseif love.keyboard.isDown "d" then
    self.angle = self.angle + 1 * dt
  end

  if love.keyboard.isDown "w" then
    self.body:applyForce(Vector(0, -self.speed):rotate(self.angle):splat())
  end
end

function Car:draw()
  love.graphics.draw(self.sprite, self.body:getX(), self.body:getY(), self.angle, 1, 1, self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

return Car
