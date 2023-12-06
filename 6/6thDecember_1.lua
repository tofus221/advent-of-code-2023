local function parsegame(timeline, distanceline)
    local t = {}
    for time in string.gmatch(timeline, "%d+") do
        table.insert(t, {time = tonumber(time)})
    end
    local i = 1
    for distance in string.gmatch(distanceline, "%d+") do
        t[i]["distance"] = tonumber(distance)
        i = i + 1
    end
    return t
end

local function calculatepossibilities(game)
    local possibilies = 0
    for speed = 0, game["time"] do
        local remaingtime = game["time"] - speed
        if (remaingtime * speed > game["distance"]) then
            possibilies = possibilies + 1
        end
    end

    return possibilies
end

function resolve(pathtoinput)
    local res = 1
    local file = io.open(pathtoinput, "r")
    local timeline = file:read("*l")
    local gameline = file:read("*l")
    local parsedgames = parsegame(timeline, gameline)
    for _, v in ipairs(parsedgames) do
        res = res * calculatepossibilities(v)
    end

    return res
end