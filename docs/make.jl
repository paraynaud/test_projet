using Documenter

#push!(LOAD_PATH,"../src/")

include("../src/test_project.jl")
using .test_project

makedocs(modules = [test_project],
	 sitename="test_projet",
	 format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
	)

deploydocs(repo = "github.com/paraynaud/test_projet.git")
