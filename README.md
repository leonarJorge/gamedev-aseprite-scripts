# aseprite-scripts
Currently there is only one script here to remap tilesets, this collection may or may not grow in the future but expect it to contain scripts related to game development only.

# Tileset
## Remap
This is a tool to remap tileset automatically, I use it specifically to convert RPG Maker MV styled autotiles into a format compatible with godot like in the example bellow, but you can also change the configuration file to suit your needs

Before

![original-grass](https://github.com/leonarJorge/aseprite-scripts/assets/12295900/641877c5-595e-4971-b28a-f709ce02c74b)


After

![green-grass-autotile](https://github.com/leonarJorge/aseprite-scripts/assets/12295900/fa8140e8-2d3a-483b-a574-c4c7aaa566e6)


You don't have to be limited to top down autotiles, if you're like me and are too lazy to draw an autotile compatible with godot from scratch even if it's for platform games you can make it in the RPG Maker MV style too and this tool will work just fine, here is an example:

Before

![original-grass-platform](https://github.com/leonarJorge/aseprite-scripts/assets/12295900/89bda612-fbc6-424f-9db9-33c22fd3e75d)

After

![grass-platform-autotile](https://github.com/leonarJorge/aseprite-scripts/assets/12295900/fbacb926-8eae-46d8-99cd-f94efb82073a)


If you just placed this project folder or cloned it directly into your Aseprite script's folder it should work normally, but if you just downloaded the script by itself or placed it in another folder you may need to edit the path to the ``remap-config.json`` file. To do so, open the script file with a text editor, and change the path ``"/scripts/gamedev-aseprite-scripts/tileset/remap-config.json"`` to the location of your configuration file in the following line

```lua
local file = io.open( app.fs.userConfigPath .. "/scripts/gamedev-aseprite-scripts/tileset/remap-config.json", "rb")
```

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/P5P7PD8FY)
