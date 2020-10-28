Powerup = Class{}

local types = {
    ['multiball'] = 9,
    ['key'] = 10
}

function Powerup:init(type)
    self.width = 8
    self.height = 8

    self.dy = 0
    self.dx = 0

    self.skin = types[type]
end

function Powerup:collides(paddle)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end
    return true
end

function Powerup:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.x <= 0 then
        self.x = 0
        self.dx = -self.dx
        gSounds['wall-hit']:play()
    end

    if self.x >= VIRTUAL_WIDTH - 8 then
        self.x = VIRTUAL_WIDTH - 8
        self.dx = -self.dx
        gSounds['wall-hit']:play()
    end

    if self.y <= 0 then
        self.y = 0
        self.dy = -self.dy
        gSounds['wall-hit']:play()
    end
end
    
function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin], 
    self.x, self.y)
end