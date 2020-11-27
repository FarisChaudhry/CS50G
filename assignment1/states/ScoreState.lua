--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local goldmedal = love.graphics.newImage('goldmedal.png')
local silvermedal = love.graphics.newImage('silvermedal.png')
local bronzemedal = love.graphics.newImage('bronzemedal.png')
local emptymedal = love.graphics.newImage('emptymedal.png')

--Medal score thresholds
BRONZE_SCORE = 5
SILVER_SCORE = 10
GOLD_SCORE = 20

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

    --medal depending on score
    if self.score >= BRONZE_SCORE then
        love.graphics.draw(bronzemedal, VIRTUAL_WIDTH / 3 - 25, 200)
    else
        love.graphics.draw(emptymedal, VIRTUAL_WIDTH / 3 - 25, 200)
    end

    if self.score >= SILVER_SCORE then
        love.graphics.draw(silvermedal, VIRTUAL_WIDTH / 2 - 25, 200)
    else
        love.graphics.draw(emptymedal, VIRTUAL_WIDTH / 2 - 25, 200)
    end

    if self.score >= GOLD_SCORE then
        love.graphics.draw(goldmedal, VIRTUAL_WIDTH / 3 * 2 - 25, 200)
    else
        love.graphics.draw(emptymedal, VIRTUAL_WIDTH / 3 * 2 - 25, 200)
    end
end