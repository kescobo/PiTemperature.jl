# Temperature Control for Raspberry Pi

by Kevin Bonham, PhD

## Set-up

Requires PiGPIO, which in turn requires StrPack.

```julia
julia> Pkg.clone("https://github.com/JuliaBerry/PiGPIO.jl")
INFO: Cloning PiGPIO from https://github.com/JuliaBerry/PiGPIO.jl
INFO: Computing changes...
INFO: No packages to install, update or remove
julia> Pkg.add("StrPack")
INFO: Cloning cache of StrPack from https://github.com/pao/StrPack.jl.git
INFO: Installing StrPack v0.2.0
INFO: Package database updated
```
