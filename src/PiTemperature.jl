module PiTemperature

export
    sensorids,
    readtemp,
#    temprange,
#    temprange!

import PiGPIO
#import Unitful.DefaultSymbols
#import Base.convert

#include("tempcontrol.jl")
include("tempsensor.jl")

end # module
