//
//  DetalleTablaController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class DetalleTablaController: UIViewController {
    
    @IBOutlet weak var tablaImg: UIImageView!
    var imgTabla = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        tablaImg.image = imgTabla
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
