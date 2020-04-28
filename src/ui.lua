local G = love.graphics

return function()
  local ui = {}

  ui.fonts = {
    title = G.newFont('assets/fonts/1980.ttf', 250),
    menu = G.newFont('assets/fonts/1980.ttf', 80),
    large = G.newFont('assets/fonts/1980.ttf', 150)
  }

  return ui
end
