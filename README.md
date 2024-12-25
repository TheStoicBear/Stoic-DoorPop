# Vehicle Door Popping Script

This script allows players to open and close the driver's side front door of their vehicle with a keybind. Additionally, players can set a specific vehicle for door popping.

## Features

- Open/close the driver's side front door of the player's vehicle.
- Set a specific vehicle for door popping.

## Installation
Add the following line to your server configuration file (`server.cfg`).

    ```cfg
    ensure Stoic-DoorPop
    ```

3. Restart your FiveM server.

## Usage

1. In-game, use the command `/setpop` to set your current vehicle for door popping.

```lua
    /setpop
```

2. Use the command `/opencar` or the specified keybind (default: F1) to toggle the driver's side front door.

```lua
    /opencar or use F1
```

3. Enjoy popping your car door!

## Configuration

The script has a configuration file (`config.lua`) where you can adjust settings.

```lua
Config = {
    DebugMode = false,  -- Set to true to enable debug messages
}
```
