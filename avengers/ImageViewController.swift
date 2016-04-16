//
//  ImageSliderViewController.swift
//  marvel_heroes
//
//  Created by Thomas Binu on 4/16/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import UIKit

class ImageViewController: ViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName:String?
    var pageIndex:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName ?? "iron_man.jpeg")
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
