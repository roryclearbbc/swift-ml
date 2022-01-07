//
//  swift_mlTests.swift
//  swift-mlTests
//
//  Created by Rory Clear on 07/01/2022.
//

import XCTest
@testable import swift_ml

class swift_mlTests: XCTestCase {

    override func setUpWithError() throws {
        let mnistData = MnistData()
        let mnistData = MnistData()
        let trainLabels = mnistData.getTrainLabels()
        let testLabels = mnistData.getTestLabels()
        let trainImages = mnistData.getTrainImages()
        let testImages = mnistData.getTestImages()
        
        let net = Net()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
