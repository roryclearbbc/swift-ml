//
//  swift_mlTests.swift
//  swift-mlTests
//
//  Created by Rory Clear on 07/01/2022.
//

import XCTest
@testable import swift_ml

class swift_mlTests: XCTestCase {

    var testImages: [[Double]] = []
    var trainImages: [[Double]] = []
    var testLabels: [Int] = []
    var net = Net()
    
    override func setUpWithError() throws {
        let mnistData = MnistData()
        let trainLabels = mnistData.getTrainLabels()
        let testLabelsUint = mnistData.getTestLabels()
        let trainImagesUint = mnistData.getTrainImages()
        let testImagesUint = mnistData.getTestImages()
        for i in 0..<testImagesUint.count {
            var image : [Double] = []
            for j in 0..<testImagesUint[i].count {
                image.append(Double(testImagesUint[i][j]) / 255)
            }
            testImages.append(image)
        }
        
        for i in 0..<trainImagesUint.count {
            var image : [Double] = []
            for j in 0..<trainImagesUint[i].count {
                image.append(Double(trainImagesUint[i][j]) / 255)
            }
            trainImages.append(image)
        }
        
        for i in 0..<testLabelsUint.count {
            testLabels.append(Int(testLabelsUint[i]))
        }
        
        net.initWeights()
        net.resetNodes()
        
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        print("A")
        XCTAssertEqual(1, 2)
    }

    func testMnistAccuracy() {
        var correct : Double = 0
        for i in 0..<testImages.count {
            net.resetNodes()
            net.forward(data: testImages[i])
            let outputLayer = net.nodes[net.layers.count - 1]
            var output = 0
            var max = outputLayer[0]
            for j in 1..<outputLayer.count {
                if outputLayer[j] > max {
                    max = outputLayer[j]
                    output = j
                }
            }
            if(testLabels[i] == output){
                correct += 1
            } else{
                print("\(testLabels[i]) \(output)")
            }
        }
        print(correct)
        XCTAssertTrue(correct > 1200)
    }

}
