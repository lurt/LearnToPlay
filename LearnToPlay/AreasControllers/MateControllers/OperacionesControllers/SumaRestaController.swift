//
//  SumaRestaController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class SumaRestaController: UIViewController {

    @IBOutlet weak var sumaRestaCollection: UICollectionView!
    
    var name = ["Sumas","Restas"]
    var images = ["sumas","restas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SumaRestaController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sumaRestaCollection.dequeueReusableCell(withReuseIdentifier: "cell07", for: indexPath) as? SumaRestaCollectionCell
        
        cell?.sumaRestaImg.image = UIImage(named: images[indexPath.row])
        cell?.sumaRestaLbl.text = name[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0 {
            //Sumas
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mateViewController = mainStoryBoard.instantiateViewController(withIdentifier: "OperacionesController") as! OperacionesController
            self.navigationController?.pushViewController(mateViewController, animated: true)
            
        } else if indexPath.row == 1{
            //Restas
            let main1StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let espViewController = main1StoryBoard.instantiateViewController(withIdentifier: "OperacionesDosController") as! OperacionesDosController
            self.navigationController?.pushViewController(espViewController, animated: true)
        }
    }
    
    
}
