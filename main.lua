Object = require "lib.classic"

local _world, _car

function love.load()
  _world = love.physics.newWorld(0, 0, true)

  -- local Car = require "car"
  -- _car = Car(_world, 100, 100)
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')
    sprites.car = love.graphics.newImage('sprites/car.png')
    car = {}
    car.x = love.graphics.getWidth() / 2
    car.y = love.graphics.getHeight() / 2
    car.speed = 180
  

    
end

function love.update(dt)
  
  if love.keyboard.isDown('w') then
      car.y = car.y - car.speed*dt
  end
  if love.keyboard.isDown('s') then
      car.y = car.y + car.speed*dt
  end
  if love.keyboard.isDown('a') then
      car.x = car.x - car.speed*dt
  end
  if love.keyboard.isDown('d') then
      car.x = car.x + car.speed*dt
  end
  _world:update(dt)
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)

  love.graphics.draw(sprites.car, car.x, car.y, carMouseAngle(), nil, nil, sprites.car:getWidth()/2, sprites.car:getHeight()/2)


end

function carMouseAngle()
  return math.atan2(car.y - love.mouse.getY(), car.x - love.mouse.getX()) + math.pi
end
