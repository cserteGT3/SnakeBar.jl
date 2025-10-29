# SnakeBar.jl

[![CI](https://github.com/Majoburo/SnakeBar.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/Majoburo/SnakeBar.jl/actions/workflows/CI.yml)
[![Documentation](https://github.com/Majoburo/SnakeBar.jl/actions/workflows/documentation.yml/badge.svg)](https://majoburo.github.io/SnakeBar.jl/)

A tqdm-like progress bar that fills your terminal with a one-character-thick snake along a random space-filling curve.

Based on [Random Space-Filling Curves](https://observablehq.com/@esperanc/random-space-filling-curves).

## Installation

```julia
using Pkg
Pkg.add(url="https://github.com/majoburo/SnakeBar.jl")
```

## Quick Start

```julia
using SnakeBar

# Simple usage with do-block
snake_bar(1:100, desc="Processing") do i
    # your code here
    sleep(0.01)
end

# Or as an iterator
for item in snake_bar(1:100, desc="Processing")
    # your code here
    sleep(0.01)
end
```

### Multi-Snake Mode

Track multiple independent processes with colored snakes:

```julia
# Create a multi-snake bar for 3 parallel processes
bar = MultiSnakeBAR(100, 3, desc="3 Parallel Processes")
start!(bar)
try
    for i in 1:100
        update_snake!(bar, 1, rand(1:3))  # Process 1 advances
        update_snake!(bar, 2, rand(1:2))  # Process 2 advances
        update_snake!(bar, 3, 1)          # Process 3 advances
    end
finally
    close!(bar)
end
```

## Features

- **Single and multi-snake modes** - Track one or many parallel processes
- **Random space-filling curves** - Each run generates a new snake path
- **tqdm-style status** - Shows progress %, ETA, rate, and per-snake counters
- **Optimized rendering** - Rate-limited to 60 FPS for smooth performance
- **Clean terminal** - Uses alternate screen buffer by default (like `vim` or `less`)
- **Zero dependencies** - Only uses Julia's standard library

## Documentation

**[Full documentation is available here](https://majoburo.github.io/SnakeBar.jl/)**

The documentation includes:
- Complete API reference with all functions and types
- Usage examples for all features
- CLI usage guide

## License

MIT

## Credits

Based on the Observable notebook [Random Space-Filling Curves](https://observablehq.com/@esperanc/random-space-filling-curves) by Claudio Esperança.
