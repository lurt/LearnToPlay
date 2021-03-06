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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0{
            //Animales invertebrados
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mateViewController = mainStoryBoard.instantiateViewController(withIdentifier: "InvertebradosController") as! InvertebradosController
            self.navigationController?.pushViewController(mateViewController, animated: true)
            
        } else if indexPath.row == 1 {
            //Animales Vertebrados
            let main1StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let profViewController = main1StoryBoard.instantiateViewController(withIdentifier: "VertebradosController") as! VertebradosController
            self.navigationController?.pushViewController(profViewController, animated: true)
        }
    }
    
    
}
