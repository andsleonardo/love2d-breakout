local class = gClass
local iffy = gIffy
local push = gPush

local this = class('Ball')

this.static.width = 8
this.static.height = 8

function this:initialize(x, y)
  self.x = x
  self.y = y
  self.dx = -150
  self.dy = -200
  self.spriteName = 'yellowBall'
end

function this:render()
  iffy.drawSprite(self.spriteName, self.x, self.y, 0, 1)
end

return this
