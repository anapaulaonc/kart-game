local Vector = require 'objects.vector'

local Car = Object:extend()

function Car:new(world, x, y)
  self.speed = 500

  self.world = world

  -- every physics item needs a body
  self.body = love.physics.newBody(self.world, x, y, 'dynamic')

  -- the shape dictates the physics behavior, such as collisions and rotation
  self.shaper = love.physics.newRectangleShape(0, 0, 32, 64)

  -- the fixture attaches the shape to the body and adds mass
  self.fixture = love.physics.newFixture(self.body, self.shaper)

  -- set damping (basically the road friction)
  self.body:setLinearDamping(2)
  self.body:setAngularDamping(5)

  self.sprite = love.graphics.newImage('sprites/car.png')
end

function Car:update(dt)
  -- direction is a vector pointing in the direction the car is facing
  local direction = Vector(0, -1):rotate(self.body:getAngle())

  -- verticalVelocity is the velocity of the car in the direction it's facing
  local verticalVelocity = Vector(self.body:getLinearVelocity()):dot(direction)

  local forceToApply = direction * self.speed

  -- rotate body, but only if the car is moving
  if love.keyboard.isDown "a" then
    self.body:applyTorque(-100 * verticalVelocity)
  elseif love.keyboard.isDown "d" then
    self.body:applyTorque(100 * verticalVelocity)
  end

  -- apply force in the direction the car is facing
  if love.keyboard.isDown "w" then
    self.body:applyForce(forceToApply.x, forceToApply.y)
  elseif love.keyboard.isDown "s" then
    self.body:applyForce(-forceToApply.x, -forceToApply.y)
  end
end

function Car:draw()
  love.graphics.draw(self.sprite, 
                     self.body:getX(), 
                     self.body:getY(), 
                     self.body:getAngle(), 
                     0.5, 0.5, 
                     self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

return Car
