//
//  MnistData.swift
//  swift-ml
//
//  Created by Rory Clear on 07/01/2022.
//

import Foundation

class MnistData {
    
    func getData() {
        print("getData")
        let a = Bundle.main.url(forResource: "train-labels-idx1-ubyte", withExtension: nil)
        do {
        let c = try Data(contentsOf: a!)
        print("worked??")
        } catch {
            print("failed")
        }
    }
    
}
