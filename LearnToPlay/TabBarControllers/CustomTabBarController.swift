//
//  CustomTabBarController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 11/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    //Variable necesaria para hacer referente al item
    var tabBarIteam = UITabBarItem()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBar()
       
    }
    
    func customBar(){
        //Apariencia de la letra de cada opcion
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
        
        //Imagenes y la forma en como se mostraran cuando son seleccionadas y deseleccionadas, siempre se mostraran en su forma original
        
        let selectedImage1 = UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage1 = UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![0]
        tabBarIteam.image = deselectedImage1
        tabBarIteam.selectedImage = selectedImage1
        
        let selectedImage2 = UIImage(named: "ic_abc")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage2 = UIImage(named: "ic_abc")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![1]
        tabBarIteam.image = deselectedImage2
        tabBarIteam.selectedImage = selectedImage2
        
        let selectedImage3 = UIImage(named: "ic_manu")?.withRenderingMode(.alwaysOriginal)
        let deselectedImage3 = UIImage(named: "ic_manu")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = self.tabBar.items![2]
        tabBarIteam.image = deselectedImage3
        tabBarIteam.selectedImage = selectedImage3
        
        //Numero de opciones que se mostraran en la tabbar, y adapatacion del tamaño
        /*let numberOfTabs = CGFloat((tabBar.items?.count)!)
        let tabBarSize = CGSize(width: tabBar.frame.width / numberOfTabs, height: tabBar.frame.height)*/
        
        //De acuerdo a la seleccion del menu es como se pondra del color indicado
        //tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: #colorLiteral(red: 0.9803921569, green: 0.5960784314, blue: 0.337254902, alpha: 1), size: tabBarSize)
        
        //Numero de opcion por el cual empieza las opciones de la tabar
        self.selectedIndex = 0
        
    }

}

//Extension uiimage para el color y tamaño de la opcion cuando es seleccionado
extension UIImage {
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
