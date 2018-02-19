mutable struct TempRange
    upper::Float64
    lower::Float64
end

function sensorids(sensordir::String="/sys/bus/w1/devices")
    sids = filter(x->startswith(x, "28-"), readdir(sensordir))
    return sids
end


"""
Get the temperature from a particular sensor based on unique id
"""
function readtemp(sensorid::String, sensordir::String="/sys/bus/w1/devices")
    sid = joinpath(sensordir, sensorid)
    p = joinpath(sid, "w1_slave")
    isfile(p) || error("Couldn't find sensor $sensorid at '$sensordir'")

    readings = readlines(p)
    if endswith(readings[1], "YES")
        m = match(r"t=(\d+)$", readings[2])
        ctemp = parse(Float64, m.captures[1]) / 1000.
        ctemp == 85. && warn("Sensor $sensorid may be improperly connected (temp = 85.000°C)")
        ftemp = ctemp * 1.8 + 32.

        return ctemp, ftemp
    else
        warn("Sensor $sensorid found, but couldn't get temp")
    end
end

function temprange!(tr::TempRange, upper::Real, lower::Real)
    tr.upper = Float64(upper)
    tr.lower = Float64(lower)
end

function temprange(upper::Real, lower::Real)
    return TempRange(upper, lower)
end
