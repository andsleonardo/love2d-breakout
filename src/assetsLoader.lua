local iffy = gIffy

-- Main spritesheet
iffy.newImage('breakoutPieces', 'assets/img/breakout_pieces.png')

-- Paddles
iffy.newSprite('breakoutPieces', 'bluePaddle', 48, 72, 64, 16)

-- Balls
iffy.newSprite('breakoutPieces', 'yellowBall', 84, 136, 8, 8)
