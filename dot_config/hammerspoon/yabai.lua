local yabaiOutput, _, _, _ = hs.execute("which yabai", true)
local yabai = string.gsub(yabaiOutput, "%s+", "")

local function execYabai(args)
    local command = string.format("%s %s", yabai, args)
    print(string.format("yabai: %s", command))
    os.execute(command)
end


-- Directions
local directions = {
    h = "west",
    l = "east",
    k = "north",
    j = "south",
}

for key, direction in pairs(directions) do
    hs.hotkey.bind({"alt"}, key, function()
        execYabai(string.format("-m window --focus %s", direction))
    end)

    hs.hotkey.bind({"alt", "shift"}, key, function()
        execYabai(string.format("-m window --warp %s", direction))
    end)

    hs.hotkey.bind({"alt", "cmd"}, key, function()
        execYabai(string.format("-m window --swap %s", direction))
    end)
end

-- Resizing
-- TODO: Add window resizing
hs.hotkey.bind({"ctrl", "shift"}, "h", function()
    execYabai("-m window --resize left:-50:0; yabai -m window --resize right:-50:0")
end)

hs.hotkey.bind({"ctrl", "shift"}, "l", function()
    execYabai("-m window --resize right:50:0; yabai -m window --resize left:50:0")
end)

hs.hotkey.bind({"ctrl", "shift"}, "j", function()
    execYabai("-m window --resize top:0:-50; yabai -m window --resize bottom:0:-50")
end)

hs.hotkey.bind({"ctrl", "shift"}, "k", function()
    execYabai("-m window --resize bottom:0:50; yabai -m window --resize top:0:50")
end)

-- Float
local floating = {
    up = "1:1:0:0:1:1", -- Full
    left = "1:2:0:0:1:1", -- Left half
    right = "1:2:1:0:1:1", -- Right half
}   

for key, gridConfig in pairs(floating) do
    hs.hotkey.bind({"alt", "shift"}, key, function()
        execYabai(string.format("--grid %s", gridConfid))
    end)
end

-- Balance
hs.hotkey.bind({"alt", "shift"}, "0", function()
    execYabai("-m space --balance")
end)

-- Layout
local layouts = {
    a = "bsp",
    d = "float",
}

for key, layout in pairs(layouts) do
    hs.hotkey.bind({"alt", "shift"}, key, function()
        execYabai(string.format("-m space --layout %s", layout))
        hs.notify.new({title="Yabai", informativeText=string.format("Switched layout: %s", layout)}):send() -- Notify about the new layout
    end)
end

-- Toggle
local toggleArgs = {
    a = "-m space --toggle padding; yabai -m space --toggle gap",
    d = "-m window --toggle zoom-parent",
    e = "-m window --toggle split",
    f = "-m window --toggle zoom-fullscreen",
    o = "-m window --toggle topmost",
    r = "-m space --rotate 90",
    t = "-m window --toggle float; yabai -m window --grid 4:4:1:1:2:2",
    s = "-m window --toggle sticky",
    x = "-m space --mirror x-axis",
    y = "-m space --mirror y-axis",
}

for key, args in pairs(toggleArgs) do
    hs.hotkey.bind({"alt"}, key, function()
        execYabai(args)
    end)
end

-- Throw/focus monitors
local targets = {
    x = "recent",
    z = "prev",
    c = "next",
}

for key, target in pairs(targets) do
    hs.hotkey.bind({"alt", "ctrl"}, key, function()
        execYabai(string.format("-m display --focus %s", target))
    end)

    hs.hotkey.bind({"ctrl", "cmd"}, key, function()
        execYabai(string.format("-m window --display %s", target))
        execYabai(string.format("-m display --focus %s", target))
    end)
end

-- Numbered monitors
-- WARN: Generates errors on non-ANSI keyboard layouts (should still works, though)
for i = 1, 5 do
    hs.hotkey.bind({"ctrl", "alt"}, tostring(i), function()
        execYabai(string.format("-m display --focus %s", i))
    end)

    hs.hotkey.bind({"ctrl", "cmd"}, tostring(i), function()
        execYabai(string.format("-m window --display %s", i))
        execYabai(string.format("-m display --focus %s", i))
    end)
end

-- End of file
return {
    yabai = yabai, 
    execYabai = execYabai,
}
