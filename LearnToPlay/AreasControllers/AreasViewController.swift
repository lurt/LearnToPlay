//
//  AreasViewController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 11/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class AreasViewController: UIViewController {
    
    @IBOutlet weak var areasCollection: UICollectionView!
    
    var name = ["Matemáticas","Español","Historia y Cultura","Geografía","Ciencias Naturales"]
    var images = ["mate","espanish","historia","geografia","natural"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
extension AreasViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = areasCollection.dequeueReusableCell(withReuseIdentifier: "cell01", for: indexPath) as? AreasCollectionCell
        
        cell?.areaImg.image = UIImage(named: images[indexPath.row])
        cell?.areaLbl.text = name[indexPath.row]
        
        return cell!
    }
    
    
}
