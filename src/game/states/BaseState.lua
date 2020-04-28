local class = gClass

local BaseState = class('BaseState')

function BaseState:initialize(handler)
  self.handler = handler

  return self
end

function BaseState:enter()end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end

return BaseState
