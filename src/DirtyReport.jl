module DirtyReport

using StatsBase

export Report

const uid = ((n)->()->n+=1)(0)

include("JsonBuilder.jl")
include("Data.jl")
include("Layout.jl")
include("Section.jl")
include("Report.jl")
include("render.jl")

end
