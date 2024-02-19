using Pkg 
using LearningMachine
using Test

Pkg.add("Random")

using Random

@testset "LearningMachine.jl" begin

    # Example: Generate a dataset with 100 samples
    num_samples = 100    
    Random.seed!(42)

    # Generate random features (two-dimensional)
    X = randn(num_samples, 2)

    # Generate corresponding labels (0 or 1)
    y = rand([0, 1], num_samples)

    # Display the first few samples
    println("Features:")
    println(X[1:5, :])
    println("\nLabels:")
    println(y[1:5])

    obj = LearningMachine.BaseRegressor()
    obj["fit"](X=X[1:80, :], y=y[1:80])
    println(obj["predict"](X=X[81:100, :]))
    @test 1 == 1
    
end
