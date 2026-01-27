local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local ram = sbar.add("graph", "widgets.ram", 42, {
  position = "right",
  graph = { color = colors.magenta },
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = { string = icons.ram },
  label = {
    string = "ram ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 9.0,
    },
    align = "right",
    padding_right = 0,
    width = 0,
    y_offset = 4
  },
  padding_right = settings.paddings + 6,
  update_freq = 2,
})

local function update_ram()
  sbar.exec("memory_pressure | grep 'System-wide memory free percentage:' | awk '{print 100-$5}'", function(result)
    local used = tonumber(result)
    if used then
      ram:push({ used / 100. })
      
      local color = colors.magenta
      if used > 50 then
        if used < 70 then
          color = colors.yellow
        elseif used < 85 then
          color = colors.orange
        else
          color = colors.red
        end
      end

      ram:set({
        graph = { color = color },
        label = "ram " .. math.floor(used) .. "%",
      })
    end
  end)
end

ram:subscribe("routine", update_ram)
ram:subscribe("forced", update_ram)

ram:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the ram item
sbar.add("bracket", "widgets.ram.bracket", { ram.name }, {
  background = { color = colors.bg1 }
})

-- Padding
sbar.add("item", "widgets.ram.padding", {
  position = "right",
  width = settings.group_paddings
})
