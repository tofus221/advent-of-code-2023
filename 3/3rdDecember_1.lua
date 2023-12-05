local function filetotable(pathtofile)
    local t = {}
    for line in io.lines(pathtofile) do
        table.insert(t, line)
    end
    return t
end

local function extractaroundsymbol(linetable, x ,y)

end

local function extractinline(line, x)
    local _start;
    local _end;
    if x == 0 then
        _start = 0
        _end = 1
    elseif x == #line then
        _start = x - 1
        _end = #line
    else
        _start = x - 1
        _end = x + 1
    end

    local extractednumbers = {}
    for i = _start, _end do
        local number = tonumber(string.sub(line, i, i))
        if number then
            local alldigits = string.match(line)
        end
    end
end

local function extractnumber(line, x)
    local numbers = {}
    if x == 0 then
        table.insert(numbers, tonumber(string.sub(line, x, x)))
        while
    end
end