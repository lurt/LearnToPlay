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
    
    var name = ["Matemáticas","Español","Sociedad","Geografía","Ciencias Naturales"]
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0 {
            //Matematicas
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mateViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MateController") as! MateController
            self.navigationController?.pushViewController(mateViewController, animated: true)
            
        } else if indexPath.row == 1 {
            //Español
            let main1StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let espViewController = main1StoryBoard.instantiateViewController(withIdentifier: "EspanolController") as! EspanolController
            self.navigationController?.pushViewController(espViewController, animated: true)
            
        } else if indexPath.row == 2 {
            //Historia y Cultura
            let main2StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let hcViewController = main2StoryBoard.instantiateViewController(withIdentifier: "HistoriaCulturaController") as! HistoriaCulturaController
            self.navigationController?.pushViewController(hcViewController, animated: true)
            
        } else if indexPath.row == 3 {
            //Geografia
            let main3StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let geoViewController = main3StoryBoard.instantiateViewController(withIdentifier: "GeografiaController") as! GeografiaController
            self.navigationController?.pushViewController(geoViewController, animated: true)
            
        } else if indexPath.row == 4{
            //Ciencias Naturales
            let main4StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let cnViewController = main4StoryBoard.instantiateViewController(withIdentifier: "CienciasNaturalesController") as! CienciasNaturalesController
            self.navigationController?.pushViewController(cnViewController, animated: true)
        }
    }
    
    
}
