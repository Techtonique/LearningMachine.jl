using Pkg
using LearningMachine
using Test

# Check if the Random package is installed, and install it if not
if !haskey(Pkg.installed(), "Random")
    Pkg.add("Random")
end

using Random

@testset "LearningMachine.jl" begin
    # Example: Generate a dataset with 100 samples
    num_samples = 100    
    Random.seed!(42)

    # Generate random features (two-dimensional)
    X = randn(num_samples, 2)

    # Generate corresponding labels (0 or 1)
    y = randn(num_samples)

    # Display the first few samples
    println("Features:")
    println(X[1:5, :])
    println("\nLabels:")
    println(y[1:5])

    # Create an object of BaseRegressor
    obj = LearningMachine.BaseRegressor()

    # Fit the model
    obj["fit"](X[1:80, :], y[1:80])

    # Make predictions
    predictions = obj["predict"](X[81:100, :])
    println(predictions)

    # Write test cases here
    @test 1 == 1
end
