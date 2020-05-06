local G = love.graphics

local ui = {}

function ui:_load()
  ui:_loadFonts()
  ui:_loadTexts()
  return self
end

function ui:_loadFonts()
  self.fonts = {
    title = G.newFont('assets/fonts/1980.ttf', 71.5),
    menu = G.newFont('assets/fonts/1980.ttf', 32),
    large = G.newFont('assets/fonts/1980.ttf', 42)
  }
end

function ui:_loadTexts()
  self.texts = {
    titleScreen = {
      gameTitle = G.newText(self.fonts.title, 'BREAKOUT'),
      menu = {
        startGame = G.newText(self.fonts.menu, 'START GAME'),
        highScores = G.newText(self.fonts.menu, 'HIGH SCORES'),
      }
    }
  }
end

return ui:_load()
