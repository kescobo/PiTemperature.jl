module PiTemperature

export
    readtemp

using PiGPIO

include("tempsensor.jl")

end # module
