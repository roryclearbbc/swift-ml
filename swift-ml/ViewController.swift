//
//  ViewController.swift
//  swift-ml
//
//  Created by Rory Clear on 07/01/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let mnistData = MnistData()
        let trainLabels = mnistData.getTrainLabels()
        let testLabels = mnistData.getTestLabels()
        let trainImages = mnistData.getTrainImages()
        let testImages = mnistData.getTestImages()
        
        let net = Net()
    }


}

