//
//  Net.swift
//  swift-ml
//
//  Created by Rory Clear on 07/01/2022.
//

import Foundation

class Net {
    let learningRate = 0.1
    let momentum = 0.5
    let gradsSizee = 0
    let layers = [784,16,10]
    
    var nodes = [[]]
    var weights = [[[]]]
    var grads = [[[[]]]]
    
    func initWeights() {
        for i in 0..<layers.count {
            var layerWeights = Array(repeating: Array(repeating: 0, count: layers[i+1]), count: layers[i]) as [[Double]]
            for y in 0..<layerWeights.count {
                for x in 0..<layerWeights[0].count {
                    let range = 1/Double(layerWeights.count).squareRoot()
                    let r = Double.random(in: -range ... range)
                }
            }
            weights.append(layerWeights)
        }
    }
    
    func resetNodes() {
        nodes = [[]]
        for i in 0..<layers.count {
            let layerNodes = Array(repeating: 0, count: layers[i]) as [Double]
            nodes.append(layerNodes)
        }
    }
    
    func activationFunction(input: Double) -> Double{
        return 1.0 / (1.0 + exp(-input)) //sigmoid
    }
    
    func forward(data: [Double]) {
        
    }
    
}
