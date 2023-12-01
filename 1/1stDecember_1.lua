function resolve(pathToInput)
    local res = 0
    for lineValue in io.lines(pathToInput) do
        local _1st = tonumber(string.match(lineValue, "%d"))
        local _2nd = tonumber(string.match(string.reverse(lineValue), "%d"))
        print(_1st * 10 + _2nd)
        res = res + _1st * 10 + _2nd
    end
    return res
end