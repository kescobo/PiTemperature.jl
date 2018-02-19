module PiTemperature

export
    sensorids,
    readtemp,
    temprange,
    temprange!

import PiGPIO

include("tempsensor.jl")

end # module
