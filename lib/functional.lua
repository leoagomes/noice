local map, apply, filter

function map(t, proc)
    local newtable = {}
    for k, v in pairs(t) do
        newtable[k] = proc(v)
    end
    return newtable
end

function apply(t, proc)
    for k, v in pairs(t) do
        proc(t)
    end
end

function filter(t, proc)
    local newtable = {}
    for k, v in pairs(t) do
        if proc(t) then
            newtable[k] = v
        end
    end
    return newtable
end

return {
    ['map'] = map,
    ['apply'] = apply,
    ['filter'] = filter,
}