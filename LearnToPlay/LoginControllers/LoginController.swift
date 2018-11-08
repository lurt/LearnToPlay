//
//  LoginController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 08/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    //Creacion de los botones de inicio de sesion, estilo, imagen, etc.
    let sigInCorreoPassword : UIButton = {
        let buttonCP = UIButton(type: .system)
        buttonCP.setTitle("Inicia Sesión Aquí", for: .normal)
        buttonCP.setTitleColor( .white, for: .normal)
        buttonCP.backgroundColor = UIColor(red:0.83, green:0.34, blue:0.05, alpha:1.0)
        buttonCP.layer.masksToBounds = true
        buttonCP.layer.cornerRadius = 10
        
        buttonCP.addTarget(self, action: #selector(inicioDeSesion), for: .touchUpInside)
        
        
        return buttonCP
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpSesion()
    }
    
    func setUpSesion(){
        sigInCorreoPassword.frame = CGRect(x: 16, y: 300 + 65, width: view.frame.width - 32, height: 30)
        view.addSubview(sigInCorreoPassword)
    }
    
    @objc func inicioDeSesion(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

