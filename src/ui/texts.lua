local G = love.graphics
local ui = gUi

local texts = {
  titleScreen = {
    gameTitle = G.newText(ui.fonts.title, 'BREAKOUT'),
    menu = {
      startGame = G.newText(ui.fonts.menu, 'Start game'),
      highScores = G.newText(ui.fonts.menu, 'High scores'),
    }
  }
}

return function(stateName)
  return texts[stateName]
end
