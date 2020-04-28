local inspect = require('lib/inspect/inspect')

return function(states)
  local this = {}

	this.empty = {
		render = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end
	}
	this.states = states or {}
	this.current = this.empty

  function this:change(stateName, enterParams)
    assert(self.states[stateName])

    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
  end

  function this:update(dt)
    self.current:update(dt)
  end

  function this:render()
    self.current:render()
  end

  return this
end
