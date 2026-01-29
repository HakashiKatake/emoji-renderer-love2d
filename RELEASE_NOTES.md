# Release Notes

## [1.0-4] - 2026-01-29
### Changed
- **Flattened Directory Structure**: Emoji images are now stored directly in the `emojis/` folder instead of `emojis/72x72/`.
- This simplifies the setup process. You only need `renderer:setEmojiDirectory("emojis")` after a standard install.

## [1.0-3] - 2026-01-29
### Fixed
- Updated Rockspec to pull source directly from the GitHub repository (`git+https://github.com/HakashiKatake/emoji-renderer-love2d.git`).
- Resolved issues with previous packaging where local paths were hardcoded.
- This is the recommended stable release for installation via LuaRocks.

## [1.0-2] - 2026-01-29
### Fixed
- Attempted to fix asset bundling by using a local source zip.
- This version ensures `emojis/` folder is correctly included in the source rock distributive.

## [1.0-1] - 2026-01-29
### Changed
- **First Public Release on LuaRocks**.
- Renamed project from `emoji-renderer` to **Luamoji**.
- Removed `scm` (development) tag to allow standard `luarocks install luamoji` without flags.

## [1.0.0] - 2026-01-29
### Added
- **File-based Asset Loading**: Emojis are now loaded lazily from the `emojis/` directory based on their Unicode hex codepoint (e.g., `1f600.png`).
- **Text Wrapping**: Added `printf` support for wrapping paragraph text containing emojis.
- **Auto-Scaling**: Emojis automatically scale to match the active font height.
- **Caching**: Implemented an internal cache to prevent reloading images from disk multiple times.

### Changed
- Refactored entire engine from spritesheet-based to file-based to support infinite scalability of emoji packs.
