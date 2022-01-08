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
    
    func derivateActivationFunction(input: Double) -> Double {
        return input * (1 - input) //sigmoid
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
        resetGrads()
        for y in 0..<weights[numberOfLayers - 2].count {
            let prevOutput = nodes[numberOfLayers - 2][y]
            for x in 0..<weights[numberOfLayers - 2][y].count {
                let output = nodes[numberOfLayers - 1][x]
                let dedw = -loss[x] * derivateActivationFunction(input: output) * prevOutput
                grad[numberOfLayers - 2][y][x] += dedw
            }
        }
        for r in stride(from: numberOfLayers - 3, to: 0, by: -1) {
            for y in 0..<weights[r].count {
                for x in 0..<weights[r][y].count {
                    var totalError = 0
                    for n in 0..<nodes[r+2].count {
                        totalError += (weights[r+1][x][n]*grad[r+1][x][n])/nodes[r+2].count
                    }
                    totalError = totalError * derivateActivationFunction(input: nodes[r+1][x]) * nodes[r][y]
                    grad[r][y][x] += totalError
                }
            }
        }
        
        for r in 0..<numberOfLayers-1 {
            for y in 0..weights[r].count {
                for x in 0..weights[r][y].count {
                    weights[r][y][x] -= learningRate * grad[r][y][x]
                }
            }
        }
        
    }
    
}
