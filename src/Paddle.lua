local K = love.keyboard
local assetsLoader = gAssetsLoader
local class = gClass
local iffy = gIffy
local push = gPush

local this = class('Paddle')

this.static.width = 64
this.static.height = 16

function this:initialize(x, y, opts)
  opts = opts or {}

  self.dx = 200
  self.x = x or 0
  self.y = y or 0
  self.sx = opts.sx or 1
  self.sy = self.sx
  self.width = this.width * self.sx
  self.height = this.height * self.sy
  self.spriteName = 'bluePaddle'
end

function this:update(dt)
  -- Move right
  if K.isDown('right') then
    self.x = self.x + self.dx * dt
  end

  -- Move left
  if K.isDown('left') then
    self.x = self.x - self.dx * dt
  end

  -- Collision with game window
  if self.x <= 0 then
    self.x = 0
  elseif self.x + self.width >= push:getWidth() then
    self.x = push:getWidth() - self.width
  end
end

function this:render()
  iffy.drawSprite(self.spriteName, self.x, self.y, 0, self.sx)
end

return this
