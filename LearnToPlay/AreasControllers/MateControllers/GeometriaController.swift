//
//  GeometriaController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class GeometriaController: UIViewController {
    
    @IBOutlet weak var tablasCollection: UICollectionView!
    
    var name = ["Tabla Multiplicar del 1 ","Tabla Multiplicar del 2","Tabla Multiplicar del 3","Tabla Multiplicar del 4","Tabla Multiplicar del 5","Tabla Multiplicar del 6","Tabla Multiplicar del 7","Tabla Multiplicar del 8","Tabla Multiplicar del 9","Tabla Multiplicar del 10"]
    var images = ["tabla1","tabla2","tabla3","tabla4","tabla5","tabla6","tabla7","tabla8","tabla9","tabla10"]
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

}

extension GeometriaController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tablasCollection.dequeueReusableCell(withReuseIdentifier: "cell08", for: indexPath) as? TablasCollectionCell
        
        cell?.tablasLbl.text = name[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetalleTablaController") as! DetalleTablaController
        
        desVC.imgTabla = UIImage(named: images[indexPath.row])!
        
        self.navigationController?.pushViewController(desVC, animated: true)
        
    
        
    }
    
    
    
}


    
    
    


