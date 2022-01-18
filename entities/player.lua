Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("/assets/player.png")
    self.x = 300
    self.y = 20
    self.speed = 50
    self.speednorm = 50
    self.speedupg = 100
    self.width = self.image:getWidth() 
end

function Player:update(dt)
    self.speed = self.speednorm
    if love.keyboard.isDown("lshift") then
        self.speed = self.speedupg
    end
        if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    end 
        if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end
        if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end