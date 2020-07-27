//
//  ViewController.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

