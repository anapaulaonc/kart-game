Object = require "lib.classic"

local _world, _car

function love.load()
  _world = love.physics.newWorld(0, 0, true)

  local Car = require "car"
  _car = Car(_world, 100, 100)
end

function love.update(dt)
  _car:update(dt)
  _world:update(dt)
end

function love.draw()
  _car:draw()
end
