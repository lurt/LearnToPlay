//
//  AnimalesController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class AnimalesController: UIViewController {
    
    @IBOutlet weak var animalesCollection: UICollectionView!
    
    var name = ["Vertebrados","Invertebrados"]
    var images = ["vertebrados","invertebrados"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AnimalesController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = animalesCollection.dequeueReusableCell(withReuseIdentifier: "cell05", for: indexPath) as? AnimalCollectionCell
        
        cell?.animalesLbl.text = name[indexPath.row]
        cell?.animalesImg.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    
}
