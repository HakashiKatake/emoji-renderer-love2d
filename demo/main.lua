local EmojiRenderer = require("emoji_renderer")

local renderer
local font
local bigFont

function love.load()
    -- Enable key repeat for scrolling test if needed
    love.keyboard.setKeyRepeat(true)
    
    font = love.graphics.newFont(20)
    bigFont = love.graphics.newFont(32)
    
    renderer = EmojiRenderer.new()
    renderer:setEmojiDirectory("emojis/72x72")
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    
    -- 1. Simple Print
    love.graphics.setFont(bigFont)
    love.graphics.print("1. Simple Print:", 10, 10)
    renderer:print("Hello World! 🌍 🚀", 10, 50)
    
    -- 2. Printf (Wrapping)
    love.graphics.setFont(font)
    love.graphics.print("2. Wrapped Text (limit=300):", 10, 120)
    
    local lorem = "Here is a long string with mixed emojis like 🍎 apple, 🤠 cowboy, and 👻 ghost. It should wrap nicely to the next line without breaking the renderer! 🚀 Launching into space with more text to ensure we hit the limit."
    local limit = 300
    
    -- Draw box to show limit
    love.graphics.setColor(0.3, 0.3, 0.3)
    love.graphics.rectangle("line", 10, 150, limit, 300)
    
    love.graphics.setColor(1, 1, 1)
    renderer:printf(lorem, 10, 150, limit, "left")
    
    -- 3. Center Alignment
    love.graphics.print("3. Center Alignment:", 350, 120)
    
    love.graphics.setColor(0.3, 0.3, 0.3)
    love.graphics.rectangle("line", 350, 150, limit, 150)
    
    love.graphics.setColor(1, 1, 1)
    renderer:printf("Centered content 👻\nwith multiple lines\nand 🍎 emojis!", 350, 150, limit, "center")
    
    -- Instructions
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.print("Press ESC to quit", 10, 570)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
