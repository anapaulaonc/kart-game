Object = require "lib.classic"

local _world, _car

function love.load()
  _world = love.physics.newWorld(0, 0, true)

  local Car = require "objects.car"
  _car = Car(_world, 100, 100)

  sprites = {}
  sprites.background = love.graphics.newImage('sprites/background.png')
end

function love.update(dt)
  _world:update(dt)
  _car:update(dt)
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)

  _car:draw()
end
