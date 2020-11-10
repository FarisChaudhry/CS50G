--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

--1/shinychance is the chance for a brick to be shiny when instantiated
local shinyChance = 50

function Tile:init(x, y, color, variety)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.points = self.variety * 25 + 50

    --chance to become shiny brick
    if math.random(shinyChance) == shinyChance then
    self.shiny = true
    end

    -- if the brick is shiny set up particle system for it
    if self.shiny then
        self.psystem = love.graphics.newParticleSystem(gTextures['particle'],64)
        self.psystem:setParticleLifetime(0.5, 1)
        self.psystem:setEmissionRate(5)
        --self.psystem:setLinearAcceleration(-15, 0, 15, 80)
        self.psystem:setAreaSpread('normal', 5, 5)
        self.psystem:setColors(255,255,255,255,255,255,255,0)
        self.psystem:start()
    end
end

function Tile:updateParticles(dt)
    if self.shiny then
        self.psystem:update(dt)
    end
end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
end

function Tile:renderParticles()
    if self.shiny then
        love.graphics.draw(self.psystem, self.x+(VIRTUAL_WIDTH*0.5), self.y+32)
    end
end