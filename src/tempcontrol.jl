const °C = u"°C"
const °F = u"°F"
const ctype = typeof(°C)
const ftype = typeof(°F)


mutable struct TemperatureRange{T<:Unitful.Temperature}
    setpoint::T
    tolerance::Float64
end

function uconvert(u::Unitful.Temperature, tr::TemperatureRange)
    return

function temprange(setpoint::Number, tolerance::Number)
    return TempRange(ctype, setpoint, tolerance)
end

function temprange!(tr::TempRange, setpoint::temptype, tolerance::temptype)
    tr.setpoint = setpoint
    tr.tolerance = tolerance
end

function temprange!(tr::TempRange, setpoint::Number, tolerance::Number)
    temprange!(tr, setpoint * °C, tolerance * °C)
end
