//
//  CienciasNaturalesController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class CienciasNaturalesController: UIViewController {
    
    @IBOutlet weak var cienciasCollection: UICollectionView!
    
    var name = ["Animales","Materia y Energía","Cuerpo Humano"]
    
    var images = ["animals","matenergia","cuerpo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CienciasNaturalesController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cienciasCollection.dequeueReusableCell(withReuseIdentifier: "cell04", for: indexPath) as? CienciasNCollectionCell
        
        cell?.cienciasLbl.text = name[indexPath.row]
        cell?.cienciasImg.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0 {
            //Animales
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let animalViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AnimalesController") as! AnimalesController
            self.navigationController?.pushViewController(animalViewController, animated: true)
            
        } else if indexPath.row == 1 {
            //Materia y Energia
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let matenerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MatEnergiaController") as! MatEnergiaController
            self.navigationController?.pushViewController(matenerViewController, animated: true)
            
        } else if indexPath.row == 2{
            //Cuerpo Humano
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let bodyViewController = mainStoryBoard.instantiateViewController(withIdentifier: "CuerpoHumanoController") as! CuerpoHumanoController
            self.navigationController?.pushViewController(bodyViewController, animated: true)
        }
        
        
        
    }
    
    
}
