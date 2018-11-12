//
//  MateController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 11/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class MateController: UIViewController {

    @IBOutlet weak var mateCollection: UICollectionView!
    
    var name = ["Conteo de tanto en tanto","Operaciones","Geometría"]
    
    var images = ["conteo","operaciones","geometria"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//FALTA COLOCAR LA ECTENCION DEL DATA SOURCE Y DELEGATE PARA MOSTRAR

