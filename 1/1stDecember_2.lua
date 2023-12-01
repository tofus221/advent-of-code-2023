local numbers = { "one", "1", "two", "2", "three", "3", "four", "4", "five", "5", "six", "6", "seven", "7", "eight", "8", "nine" , "9" }

local function extractdigits(line)
    local extractedlist = {}
    for i = 1, #line do
        for k, v in ipairs(numbers) do
            local value = string.find(line, "^"..v, i)
            if (value ~= nil) then
                table.insert(extractedlist ,math.ceil(k / 2))
            end
        end
    end
    return extractedlist
end

function resolve(pathtofile)
    local res = 0
    for line in io.lines(pathtofile) do
        local extracted = extractdigits(line)
        print(extracted[1] * 10 + extracted[#extracted])
        res = res + extracted[1] * 10 + extracted[#extracted]
    end
    return res
end