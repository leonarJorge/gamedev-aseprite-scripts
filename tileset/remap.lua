function takeImage( sprite, x, y, scale )
    local temp = Sprite(sprite)
    local rect = Rectangle{ x = (x * scale), y = (y * scale), width = scale, height = scale }
    temp:crop(rect)
    local image = Image(temp)
    temp:close()

    return image
end

function drawImage(img, x, y, scale, target)
    local point = Point(x * scale, y * scale)
    target:drawImage(img, point)
end

-- You may need to change this path according to the location of the configuration file
local file = io.open( app.fs.userConfigPath .. "/scripts/gamedev-aseprite-scripts/tileset/remap-config.json", "rb")
local config = json.decode(file:read "*a")
file:close()

local mappings = {}
local options = {}
for i, map in ipairs(config.mappings) do
    mappings[map.name] = map
    options[i] = map.name
end

local CURRENT_SPRITE = app.sprite

local dlg = Dialog()
dlg:number{ id="tilesize", label="Tile Size (px)", text="32" }
dlg:combobox{ id="mapname",
              label="Layout",
              option=options[0],
              options=options
            }
dlg:check{ id="grid", label="Show Grid", selected=true }
dlg:button{ id="confirm", text="Confirm" } 
dlg:button{ id="cancel", text="Cancel" } 
dlg:show();

if dlg.data.confirm then
    
    local map = mappings[dlg.data.mapname]
    local source_sprite = app.sprite
    local SCALE = dlg.data.tilesize * map.scale
    local TARGET_IMAGE = Image( map.output.width * SCALE, map.output.height * SCALE)
    
    for _, mappedTile in ipairs(map.tiles) do
        local img = takeImage(source_sprite, mappedTile.source.x, mappedTile.source.y, SCALE)
        for _, target in ipairs(mappedTile.target) do
            drawImage(img, target.x, target.y, SCALE, TARGET_IMAGE)
        end
    end
    
    local target_sprite = Sprite(TARGET_IMAGE.spec)
    target_sprite.gridBounds = Rectangle{ x = 0, y = 0, width = dlg.data.tilesize, height = dlg.data.tilesize }

    for i,cel in ipairs(target_sprite.cels) do
        cel.image = TARGET_IMAGE
    end

    if dlg.data.grid then
        app.command.ShowGrid()
    end
end