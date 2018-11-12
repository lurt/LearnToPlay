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

extension MateController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mateCollection.dequeueReusableCell(withReuseIdentifier: "cell02", for: indexPath) as? MateCollectionCell
        
        cell?.mateLbl.text = name[indexPath.row]
        cell?.mateImg.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    
}

