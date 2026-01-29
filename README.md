# Luamoji (Love2D Emoji Renderer)

A scalable, file-based emoji rendering library for LÖVE (Love2D).
It lazily loads emoji images from a folder, allowing you to use high-quality emoji packs (like Twemoji) without managing massive spritesheets.

## ☕ Support

If you find this library useful, please consider supporting me and my studio **StopwatchGames**!  
Your sponsorship helps fund my upcoming games. 🎮

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/stopwatchgames)

## Features
- **File-based Lazy Loading**: Only loads the emojis you actually use.
- **Auto-Scaling**: Emojis automatically resize to match your font height.
- **Text Wrapping**: Full `printf` support for mixed text and emojis.
- **Utf-8 Support**: Works with standard Lua strings containing emoji characters.

## 📦 Installation

### Method 1: Local Copy (Simplest & Best for Distribution)
1. Download the latest **[Release Zip](https://github.com/HakashiKatake/emoji-renderer-love2d/releases)** or `luamoji_release.zip`.
2. Extract it into your game's folder.
3. Your folder should look like this:
   ```text
   my_game/
   ├── main.lua
   ├── luamoji.lua
   └── emojis/ (folder containing images)
   ```

### Method 2: LuaRocks (For Advanced Users)
Since Love2D is sandboxed, you must install the rock **locally into your project folder** (vendoring).

1. In your project terminal, run:
   ```bash
   luarocks install --tree lua_modules luamoji
   ```
   *(This creates a `lua_modules` folder inside your project)*

2. Configure your `main.lua` to find it:
   ```lua
   -- Add the local tree to the package path
   package.path = "lua_modules/share/lua/5.1/?.lua;" .. package.path

   local Luamoji = require("luamoji")
   ```

3. Be sure to point to the correct emoji directory inside that tree:
   ```lua
   local renderer = Luamoji.new()
   -- Point to the emojis installed by LuaRocks
   renderer:setEmojiDirectory("lua_modules/lib/luarocks/rocks-5.1/luamoji/1.0-4/emojis")
   ```

> **Tip:** You can download the full set of **Twemoji 72x72** icons directly.
> 1. Go to the [Twemoji Repo](https://github.com/twitter/twemoji/tree/master/assets/72x72).
> 2. Download the folder.
> 3. Rename it to `emojis` and drop it in your game folder.

## 🚀 Usage

### basic Setup
In your `main.lua`:

```lua
local Luamoji = require("luamoji")
local renderer

function love.load()
    -- Create the renderer
    renderer = Luamoji.new()
    
    -- Tell it where to find your emoji images (if manually installed)
    -- If using LuaRocks, it tries to find them automatically, or you can specify:
    renderer:setEmojiDirectory("emojis")
end
```

### Rendering Text
Use `renderer:print` exactly like `love.graphics.print`:

```lua
function love.draw()
    -- Set your font first, the emojis will scale to match it!
    love.graphics.setFont(yourFont)
    
    -- Simple rendering
    renderer:print("Hello World! 🌍", 100, 100)
    
    -- Mixed text works automatically
    renderer:print("Press 🅰️ to Start!", 100, 150)
end
```

### Text Wrapping (printf)
Use `renderer:printf` for paragraphs that need to wrap inside a box:

```lua
local limit = 300
local align = "center" -- left, center, right

renderer:printf("This is a long string with mixed emojis 🍎 that will wrap nicely!", x, y, limit, align)
```

## 🛠️ API Reference

- `renderer = Luamoji.new()`: Creates a new instance.
- `renderer:setEmojiDirectory(path)`: Sets the folder path (e.g., "assets/emojis").
- `renderer:setEmojiSize(size)`: Manually sets the base size if not autodetected (default 32).
- `renderer:print(text, x, y)`: Draws text with emojis.
- `renderer:printf(text, x, y, limit, align)`: Draws wrapped text with emojis.
- `renderer:getWidth(text, font)`: Returns the width of the string in pixels, accounting for emojis.

## License
MIT

---


