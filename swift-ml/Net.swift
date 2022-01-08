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
    
    var nodes: [[Double]] = [[]]
    var weights: [[[Double]]] = [[[]]]
    var grad: [[[Double]]] = [[[]]]
    
    func initWeights() {
        weights.remove(at: 0)
        for i in 0..<layers.count-1 {
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
    
    func resetGrads() {
        grad.remove(at: 0)
        for i in 0..<layers.count-1 {
            var layerGrads = Array(repeating: Array(repeating: 0, count: layers[i+1]), count: layers[i]) as [[Double]]
            grad.append(layerGrads)
        }
    }
    
    func resetNodes() {
        nodes = [[]]
        nodes.remove(at: 0)
        for i in 0..<layers.count {
            let layerNodes = Array(repeating: 0, count: layers[i]) as [Double]
            nodes.append(layerNodes)
        }
    }
    
    func activationFunction(input: Double) -> Double{
        return 1.0 / (1.0 + exp(-input)) //sigmoid
    }
    
    func forward(data: [Double]) {
        for i in 0..<layers[0] {
            nodes[0][i] = data[i]
        }
        
        for i in 1..<layers.count {
            for x in 0..<layers[i]{
                var total : Double = 0
                for y in 0..<layers[i-1] {
                    total += nodes[i-1][y] * weights[i-1][y][x]
                }
                total = activationFunction(input: total)
                nodes[i][x] = total
            }
        }
        
    }
    
    func getLoss(answer: Int) -> [Double] {
        let output = nodes[nodes.count - 1]
        var loss = Array(repeating: 0, count: output.count) as [Double]
        for i in 0..<output.count {
            if(i == answer) {
                loss[i] = 1 - output[i]
            }else{
                loss[i] = 0 - output[i]
            }
        }
        return loss
    }
    
    func backprop(loss: [Double]) {
        let numberOfLayers = layers.count
        
    }
    
}
