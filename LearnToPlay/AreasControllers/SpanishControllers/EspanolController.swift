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
    
    var name = ["Dictado","Profesiones","Sinónimos y Antónimos"]
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        if indexPath.row == 0 {
            //Dictado
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mateViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DictadoController") as! DictadoController
            self.navigationController?.pushViewController(mateViewController, animated: true)
            
        } else if indexPath.row == 1 {
            //Profesiones
            let main1StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let profViewController = main1StoryBoard.instantiateViewController(withIdentifier: "ProfesionesController") as! ProfesionesController
            self.navigationController?.pushViewController(profViewController, animated: true)
            
        } else if indexPath.row == 2 {
            //Sinonimos y antonimos
            let main1StoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let profViewController = main1StoryBoard.instantiateViewController(withIdentifier: "SinonimosAntController") as! SinonimosAntController
            self.navigationController?.pushViewController(profViewController, animated: true)
            
        }
    }
    
    
    
}
