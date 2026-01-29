-- Add the project root to package.path so we can require 'luamoji'
-- (Assuming this main.lua is inside a 'demo/' folder)
package.path = package.path .. ";../?.lua"

local Luamoji = require("luamoji")
local renderer

function love.load()
    renderer = Luamoji.new()
    
    -- Point to the emojis folder at the project root
    -- (Relative to this main.lua, it is one level up)
    renderer:setEmojiDirectory("../emojis")
    
    print("Demo loaded! Using emojis from ../emojis")
end

function love.draw()
    love.graphics.print("Luamoji Local Demo", 10, 10)
    
    -- Render some emojis
    renderer:print("It works! 🍎 🚀 🤠", 10, 50)
    
    -- Test wrapping
    renderer:printf("This is a longer text that should wrap correctly with emojis like 🎅 and 🎉 inside it.", 10, 100, 300, "left")
end
