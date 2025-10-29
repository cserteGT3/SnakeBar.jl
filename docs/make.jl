using Documenter
using SnakeBar

makedocs(;
    modules=[SnakeBar],
    sitename="SnakeBar.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://majoburo.github.io/SnakeBar.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API Reference" => "api.md",
    ],
)

deploydocs(;
    repo="github.com/Majoburo/SnakeBar.jl",
    devbranch="main",
)
