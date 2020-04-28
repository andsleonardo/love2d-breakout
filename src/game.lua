local FSMachina = require('lib/FSMachina')

local TitleScreenState = require('src/game/states/TitleScreenState')
local PaddleSelectionState = require('src/game/states/PaddleSelectionState')

return function()
  local game = {}

  game.stateMachine = FSMachina({
    titleScreen = function() return TitleScreenState(game) end,
    paddleSelection = function() return PaddleSelectionState(game) end
  })

  game.stateMachine:change('titleScreen')

  function game:update(dt)
    self.stateMachine:update(dt)
  end

  function game:render()
    self.stateMachine:render()
  end

  function game:goTo(stateName)
    self.stateMachine:change(stateName)
  end

  return game
end
