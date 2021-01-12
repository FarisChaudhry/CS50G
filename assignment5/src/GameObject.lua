--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    -- wether object is collidable or consumable
    self.collidable = def.collidable or false
    self.consumable = def.consumable or false
    self.interactable = def.interactable or false

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end
    self.onConsume = function() end
    self.onInteract = function() end
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end

function GameObject:inReach(entity)
    local inReach = false

    if entity.direction == 'left' then
        if (0 < entity.x - self.x and entity.x - self.x < TILE_SIZE) and 
        (math.abs(self.y - (entity.y + entity.height/2)) < TILE_SIZE/2) then 
            inReach = true 
        end
    elseif entity.direction == 'right' then
        if (0 > entity.x - self.x and entity.x - self.x > -TILE_SIZE) and 
        (math.abs(self.y - (entity.y + entity.height/2)) < TILE_SIZE/2) then 
            inReach = true 
        end
    elseif entity.direction == 'up' then
        if (math.abs(self.x + self.width/2 - (entity.x + entity.width/2)) < TILE_SIZE/2) and
        (0 < entity.y - self.y and entity.y - self.y < TILE_SIZE) then 
            inReach = true
        end
    elseif entity.direction == 'down' then
        if (math.abs(self.x + self.width/2 - (entity.x + entity.width/2)) < TILE_SIZE/2) and 
        (0 > entity.y - self.y + entity.height/2 and entity.y - self.y + entity.height/2 > -TILE_SIZE) then 
            inReach = true 
        end
    end

    return inReach
end