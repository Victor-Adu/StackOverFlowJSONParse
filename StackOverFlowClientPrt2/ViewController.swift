//
//  ViewController.swift
//  StackOverFlowClientPrt2
//
//  Created by Victor  Adu on 7/29/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bradJ = NetworkController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bradJ.stackURLData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

