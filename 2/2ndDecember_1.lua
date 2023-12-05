function parseline(line)
    local t = {green = 0, red = 0, blue = 0, game = 0}
    print(line)
    t["game"] = tonumber(string.match(line, "Game (%d+)"))
    for cubeofcolor in string.gmatch(line, "(%d+%s%a)") do
        local number = tonumber(string.match(cubeofcolor,"%d+"))
        if (string.sub(cubeofcolor, #cubeofcolor, #cubeofcolor) == "r" and number > t["red"]) then
            t["red"] = number
        elseif (string.sub(cubeofcolor, #cubeofcolor, #cubeofcolor) == "g" and number > t["green"]) then
            t["green"] = number
        elseif (string.sub(cubeofcolor, #cubeofcolor, #cubeofcolor) == "b" and number > t["blue"]) then
            t["blue"] = number
        end
    end

    print(string.format("r: %i, g: %i, b:%i, game: %i", t["red"], t["green"], t["blue"], t["game"]))
    return t
end

function resolve(pathToInput)
    local res = 0
    for lineValue in io.lines(pathToInput) do
        local linetable = parseline(lineValue)
        if (linetable["green"] <= 13 and linetable["red"] <= 12 and linetable["blue"] <= 14) then
            res = res + linetable["game"]
        end
    end
    return res
end