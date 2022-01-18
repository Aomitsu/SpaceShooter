Enemy1 = Object:extend()

function Enemy1:new()
    self.image = love.graphics.newImage("/assets/enemy1.png")
    self.x = 300
    self.y = 500
    self.speed = 20
    self.speednorm = 20
    self.speedupg = 40
    self.width = self.image:getWidth() 
end

function Enemy1:update(dt)
    -- Make the enemy move in negative x direction without stopping
    self.x = self.x - self.speed * dt
    if self.x < 0 then
        self.x = 800
    end

    if self.x < player.x then
        self.speed = self.speednorm
    else
        self.speed = self.speedupg
        if player.y < self.y then
            self.y = self.y - self.speed * dt
        elseif player.y > self.y then
            self.y = self.y + self.speed * dt
        end
    end
end

function Enemy1:draw()
    love.graphics.draw(self.image, self.x, self.y)
end