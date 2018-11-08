//
//  LoginController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 08/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import FirebaseUI
import GoogleSignIn
import FacebookLogin

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

    //Variables
    var userData = UserDefaults.standard
    
    
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
        // 1.- Obtenemos el objeto default de authUI
        let authUI = FUIAuth.defaultAuthUI()
        
        let terminos = URL(string: "https://firebase.google.com/terms/")!
        authUI?.tosurl = terminos
        
        guard authUI != nil else {
            //log error
            print("Hubo error en el login con correo y contraseña en firebase")
            return
        }
        // 2.- Delegate
        authUI?.delegate = self
        authUI?.providers = [FUIGoogleAuth(),FUIFacebookAuth()]
        
        // 3.- Obtenemos la referencia de authUI view controller
        let authViewController = authUI!.authViewController()
        
        // 4.- Mostrar
        present(authViewController, animated: true, completion: nil)
        
        print("Se registro correctamente en firebase")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LoginController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //checamos si hay error
        if error != nil{
            //si hubo error
            return
        }
        //authDataResult?.user.uid
        //Cuando el usuario a pasado el login
        performSegue(withIdentifier: "principalSegue", sender: self)
        print("Inicio sesion correctamente a la app")
        userData.set(true, forKey: "loginHecho")
        userData.synchronize()
    }
}


