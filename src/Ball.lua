local class = gClass
local iffy = gIffy
local push = gPush

local this = class('Ball')

this.static.width = 8
this.static.height = 8

function this:initialize(x, y, opts)
  opts = opts or {}

  self.x = x
  self.y = y
  self.dx = -150
  self.dy = -200
  self.sx = opts.sx or 1
  self.sy = self.sx
  self.width = this.width * self.sx
  self.height = this.height * self.sy
  self.spriteName = 'yellowBall'
end

function this:update(dt)
  -- ball movement
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt

  -- horizontal collision with the screen
  if self.x <= 0 or self.x + self.width >= push:getWidth() then
    self.dx = -self.dx
  end

  -- collision with the top of the screen
  if self.y <= 0 then
    self.dy = -self.dy
  end
end

function this:collides(target)
  if self.y + self.height >= target.y and
    self.y <= target.y + target.height and
    self.x + self.width >= target.x and
    self.x + self.width <= target.x + target.width
  then
    self.dy = -self.dy
  end
end

function this:render()
  iffy.drawSprite(self.spriteName, self.x, self.y, 0, 1)
end

return this
