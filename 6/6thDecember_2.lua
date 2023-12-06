local function parsegame(timeline, distanceline)
    local time = ""
    local distance = ""
    for time_str in string.gmatch(timeline, "%d+") do
        time = time .. time_str
    end
    print(time)
    for distance_str in string.gmatch(distanceline, "%d+") do
        distance = distance .. distance_str
    end
    print(distance)
    return {time = tonumber(time), distance = tonumber(distance)}
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
    local game = parsegame(timeline, gameline)
    res = calculatepossibilities(game)
    return res
end