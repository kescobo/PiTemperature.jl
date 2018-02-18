"""
Get the temperature from a particular sensor based on unique id
"""
function readtemp(sensorid::String, sensordir::String="/sys/bus/w1/devices")
    sid = joinpath(sensors, sensorid)
    p = joinpath(sid, "w1_slave")
    isfile(p) || error("Couldn't find sensor $sensorid at '/sys/bus/w1/devices'")

    readings = readlines(p)
    if endswith(readings[1], "YES")
        m = match(r"t=(\d+)$", s)
        ctemp = parse(m.captures[1], Float64) / 1000
        ctemp == 85. && warn("Sensor $sensorid may be improperly connected (temp = 85.000°C)")
        ftemp = ctemp * 1.8 + 32

        return ctemp, ftemp
    else
        warn("Sensor $sensorid found, but couldn't get temp")
    end
end
