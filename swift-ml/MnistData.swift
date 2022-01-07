//
//  MnistData.swift
//  swift-ml
//
//  Created by Rory Clear on 07/01/2022.
//

import Foundation

class MnistData {
    
    func getTrainLabels() -> [UInt8] {
        let url = Bundle.main.url(forResource: "train-labels-idx1-ubyte", withExtension: nil)
        let data = NSData(contentsOf: url!)
        var array = [UInt8](data!)
        array = Array(array.dropFirst(8))
        return array

    }
    
    func getTestLabels() -> [UInt8] {
        let url = Bundle.main.url(forResource: "t10k-labels-idx1-ubyte", withExtension: nil)
        let data = NSData(contentsOf: url!)
        var array = [UInt8](data!)
        array = Array(array.dropFirst(8))
        return array
    }
    
    func getTrainImages() -> [[UInt8]]{
        let url = Bundle.main.url(forResource: "train-images-idx3-ubyte", withExtension: nil)
        var out : [[UInt8]] = [[]]
        let data = NSData(contentsOf: url!)
        var array = [UInt8](data!)
        array = Array(array.dropFirst(16))
        for i in stride(from: 0, to: array.count, by: 28*28) {
            var image : [UInt8] = []
            for y in 0..<784 {
                image.append(array[i+y])
            }
            out.append(image)
        }
        return out
    }
    
    func getTestImages() -> [[UInt8]]{
        let url = Bundle.main.url(forResource: "t10k-images-idx3-ubyte", withExtension: nil)
        var out : [[UInt8]] = [[]]
        let data = NSData(contentsOf: url!)
        var array = [UInt8](data!)
        array = Array(array.dropFirst(16))
        for i in stride(from: 0, to: array.count, by: 28*28) {
            var image : [UInt8] = []
            for y in 0..<784 {
                image.append(array[i+y])
            }
            out.append(image)
        }
        return out
    }
    
}

