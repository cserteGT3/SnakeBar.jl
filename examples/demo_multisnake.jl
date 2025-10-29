#!/usr/bin/env julia
using SnakeBar

# Demo: Multi-snake progress bar with 5 colorful snakes
# Using update! to advance all snakes together uniformly
bar = MultiSnakeBAR(100, 5, desc="5 Parallel Processes", seed=42)
start!(bar)

try
    for i in 1:100
        update!(bar, 1)  # Advances all 5 snakes together
        sleep(0.03)
    end

    # Pause for 2 seconds at completion to show filled screen
    sleep(2)
finally
    close!(bar)
end
