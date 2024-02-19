using Pkg 
using LearningMachine
using Test

Pkg.add("Random")

using Random

@testset "LearningMachine.jl" begin
    # Example: Generate a dataset with 100 samples
    num_samples = 100
    features, labels = generate_classification_dataset(num_samples)

    Random.seed!(42)

    # Generate random features (two-dimensional)
    features = randn(num_samples, 2)

    # Generate corresponding labels (0 or 1)
    response = rand([0, 1], num_samples)

    # Display the first few samples
    println("Features:")
    println(features[1:5, :])
    println("\nLabels:")
    println(labels[1:5])

    obj = LearningMachine.BaseRegressor()
    obj["fit"](X=features[1:80, :], y=labels[1:80])
    println(obj["predict"](X=features[81:100, :]))
    @test 1 == 1
    
end
