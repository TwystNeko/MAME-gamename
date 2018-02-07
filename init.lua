-- gamename.lus
-- by TwystNeko
-- 
-- outputs a sanitized game name to a text file.

local exports = {}
exports.name = "gamename"
exports.version = "1.0.0"
exports.description = "Game Name"
exports.license = "WTFPL license"
exports.author = { name = "twystneko@gmail.com" }
local gamename = exports
local images = 1

function gamename.startplugin() 
    emu.register_start(function() 
        gn = emu.gamename():sub(1, string.find(emu.gamename(), ' (', 1, true));
        rn = emu.romname() .. '.png';
        if gn ~= 'No Driver Loaded' then
            file = io.open("gamename.txt", "w");
            file:write(gn);
            file:close();
            if images == 1 then 
                local inp = assert(io.open("Titles/"..rn, "rb"))
                local out = assert(io.open("gameimage.png", "wb"))
                out:write(inp:read("*all"))
                out:close()
                inp:close()
            end
        end
    end)
end

return exports