Powerup = Class{}

local types = {
    ['multiball'] = 9,
    ['key'] = 10
}

function Powerup:init(type)
    self.width = 8
    self.height = 8
    self.x = math.random(12,VIRTUAL_WIDTH-20)
    self.y = -15

    self.dy = math.random(20,40)
    self.dx = math.random(-50,50)

    self.inPlay = true

    self.type = types[type]
end

function Powerup:collides(paddle)
    if self.inPlay then
        if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
            return false
        end
        if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
            return false
        end
        self.inPlay = false
        return true
    end
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
end
    
function Powerup:render()
    if self.inPlay == true then
        love.graphics.draw(gTextures['main'], gFrames['powerups'][self.type], 
        self.x, self.y)
    end
end