//
//  MnistData.swift
//  swift-ml
//
//  Created by Rory Clear on 07/01/2022.
//

import Foundation

class MnistData {
    
    func getTrainLabels() -> [UInt8] {
        print("getData")
        let url = Bundle.main.url(forResource: "train-labels-idx1-ubyte", withExtension: nil)
        do {
            let data = try NSData(contentsOf: url!)
            var array = [UInt8](data!)
            array = Array(array.dropFirst(8))
            return array
        } catch {
            print("failed")
        }
    }
    
    func getTestLabels() -> [UInt8] {
        print("getData")
        let url = Bundle.main.url(forResource: "t10k-labels-idx1-ubyte", withExtension: nil)
        do {
            let data = try NSData(contentsOf: url!)
            var array = [UInt8](data!)
            array = Array(array.dropFirst(8))
            return array
        } catch {
            print("failed")
        }
    }
    
}

public extension Data {
    
    func to<T>(_ type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }
}
