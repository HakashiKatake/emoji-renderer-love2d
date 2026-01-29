# Luamoji (Love2D Emoji Renderer)

A scalable, file-based emoji rendering library for LÖVE (Love2D).
It lazily loads emoji images from a folder, allowing you to use high-quality emoji packs (like Twemoji) without managing massive spritesheets.

## Features
- **File-based Lazy Loading**: Only loads the emojis you actually use.
- **Auto-Scaling**: Emojis automatically resize to match your font height.
- **Text Wrapping**: Full `printf` support for mixed text and emojis.
- **Utf-8 Support**: Works with standard Lua strings containing emoji characters.

## 📦 Installation

### Option 1: LuaRocks (Recommended)
The easiest way to install Luamoji is via LuaRocks:

```bash
luarocks install luamoji
```

### Option 2: Manual Installation
1. Copy the `luamoji.lua` file into your project folder.
2. Create an `emojis` folder in your project's directory.
3. Add emoji images (e.g., `1f600.png`) to that folder.

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
