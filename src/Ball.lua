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

function this:render()
  iffy.drawSprite(self.spriteName, self.x, self.y, 0, 1)
end

return this
