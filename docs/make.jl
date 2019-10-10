using Documenter

#push!(LOAD_PATH,"../src/")

include("../src/test_project.jl")
using .test_project

makedocs(modules = [test_project], sitename="My Documentation")

deploydocs(repo = "github.com/JuliaLang/test_projet.git")
