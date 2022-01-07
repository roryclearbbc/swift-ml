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
    
    init() {
        print("init")
    }
    
}
