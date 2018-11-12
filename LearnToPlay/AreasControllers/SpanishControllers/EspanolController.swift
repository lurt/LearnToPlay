//
//  EspanolController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class EspanolController: UIViewController {
    
    @IBOutlet weak var espanolCollection: UICollectionView!
    
    var name = ["Singular y Plural","Femenino y Masculino","Las Sílabas"]
    
    var images = ["plural","masculinofeme","silabas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension EspanolController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = espanolCollection.dequeueReusableCell(withReuseIdentifier: "cell03", for: indexPath) as? EspanolCollectionCell
        
        cell?.espanolLbl.text = name[indexPath.row]
        cell?.espanolImg.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    
    
}
