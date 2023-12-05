require("2.2ndDecember_1")

function resolve(pathToInput)
    local res = 0
    for lineValue in io.lines(pathToInput) do
        local linetable = parseline(lineValue)
        res = res + linetable["red"] * linetable["green"] * linetable["blue"]
    end
    return res
end