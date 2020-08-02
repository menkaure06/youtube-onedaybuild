//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Nadario Ferguson on 8/2/20.
//  Copyright © 2020 Nadario Ferguson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        model.getVideos()
        
       
    }


}

