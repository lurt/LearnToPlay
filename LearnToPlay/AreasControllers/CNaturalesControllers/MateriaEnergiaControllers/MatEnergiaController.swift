//
//  MatEnergiaController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class MatEnergiaController: UIViewController {

    @IBOutlet weak var matEnergiaCollection: UICollectionView!
    
    var name = ["Los Planetas","Energia"]
    var images = ["planetas","energia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}

extension MatEnergiaController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = matEnergiaCollection.dequeueReusableCell(withReuseIdentifier: "cell06", for: indexPath) as? MatEnergiaCollectionCell
        
        cell?.matEnergiaLbl.text = name[indexPath.row]
        cell?.matEnergiaImg.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0 {
            //Planetas
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let matenerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "PlanetasController") as! PlanetasController
            self.navigationController?.pushViewController(matenerViewController, animated: true)
            
        } else if indexPath.row == 1 {
            //Energia
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let energiaViewController = mainStoryBoard.instantiateViewController(withIdentifier: "EnergiaController") as! EnergiaController
           self.navigationController?.pushViewController(energiaViewController, animated: true)
            
        }
    }
    
    
}
