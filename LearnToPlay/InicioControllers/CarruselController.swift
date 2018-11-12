//
//  CarruselController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 11/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class CarruselController: UIViewController {
    
    
    @IBOutlet weak var imagenesView: UIImageView!
    
    //variables para las imagenes
    var imagenesCarrusel: String!
    var pageIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Se agrega el carrusel de imagenes en la vista home
        imagenesView.image = UIImage(named: imagenesCarrusel)
    }

}
