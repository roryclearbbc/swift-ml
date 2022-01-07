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
    
    override func setUpWithError() throws {
        let mnistData = MnistData()
        let trainLabels = mnistData.getTrainLabels()
        let testLabels = mnistData.getTestLabels()
        let trainImagesUint = mnistData.getTrainImages()
        let testImagesUint = mnistData.getTestImages()
        
        for i in 0..<testImagesUint.count {
            var image : [Double] = []
            for j in 0..<testImagesUint[i].count {
                image.append(Double(testImagesUint[i][j]))
            }
        }
        
        for i in 0..<trainImagesUint.count {
            var image : [Double] = []
            for j in 0..<trainImagesUint[i].count {
                image.append(Double(trainImagesUint[i][j]))
            }
        }
        
        let net = Net()
        net.initWeights()
        
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        print("A")
        XCTAssertEqual(1, 2)
    }

    func testMnistAccuracy() {

    }

}
