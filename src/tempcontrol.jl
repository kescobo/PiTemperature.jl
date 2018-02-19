mutable struct TempRange
    lower::typeof(1.0u"°C")
    upper::typeof(1.0u"°C")

    TempRange(lower, upper) = upper >= lower ? new(lower, upper) : error("upper range must be greater than lower range")
end

const °C = 1.0u"°C"
const temptype = typeof(°C)

convert(::Type{temptype}, n::Real) = n * °C

function temprange!(tr::TempRange, upper::temptype, lower::temptype)
    tr.upper = upper
    tr.lower = lower
end
