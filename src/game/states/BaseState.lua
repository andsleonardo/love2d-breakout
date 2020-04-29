local class = gClass

local this = class('BaseState')

function this:initialize(handler)
  self.handler = handler
end

function this:enter()end
function this:exit() end
function this:update(dt) end
function this:render() end

return this
