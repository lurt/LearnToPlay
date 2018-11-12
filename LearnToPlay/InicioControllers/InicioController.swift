//
//  InicioController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 08/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class InicioController: UIViewController, UIPageViewControllerDataSource {
    
    var pageImagenes:NSArray!
    var pageViewController:UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //se agrega carrusel de imagenes en la vista home
        pageImagenes = NSArray(objects: "carrusel1","carrusel2","carrusel3")
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "carruselPageController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let initialContentViewController = self.pageTutorialAtIndex(index: 0) as CarruselController
        
        let viewControllers = NSArray(object: initialContentViewController)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height + 50)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)

        
    }
    
    func pageTutorialAtIndex(index: Int) -> CarruselController{
        
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "CarruselController") as! CarruselController
        pageContentViewController.imagenesCarrusel = pageImagenes[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! CarruselController
        var index = viewController.pageIndex as Int
        
        if index == 0 || index == NSNotFound {
            
            return nil
        }
        
        index -= 1
        
        return self.pageTutorialAtIndex(index: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! CarruselController
        var index = viewController.pageIndex as Int
        
        if ((index == NSNotFound)){
            return nil
        }
        index += 1
        
        if (index == pageImagenes.count) {
            return nil
        }
        
        return self.pageTutorialAtIndex(index: index)
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return pageImagenes.count
        
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    


}
