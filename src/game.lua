local FSMachina = require('lib/FSMachina')

local TitleScreenState = require('src/game/states/TitleScreenState')
local ServingState = require('src/game/states/ServingState')
local PlayingState = require('src/game/states/PlayingState')

local game = {}

function game:_load()
  self.stateMachine = FSMachina({
    titleScreen = function() return TitleScreenState(game) end,
    serving = function() return ServingState(game) end,
    playing = function() return PlayingState(game) end,
  })

  self.stateMachine:change('titleScreen')

  return self
end

function game:update(dt)
  self.stateMachine:update(dt)
end

function game:render()
  self.stateMachine:render()
end

function game:goTo(stateName)
  self.stateMachine:change(stateName)
end

return game:_load()
