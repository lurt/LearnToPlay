//
//  MenuController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 11/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseDatabase
import GoogleSignIn
import FacebookLogin
import FacebookCore
import FBSDKLoginKit
import FBSDKCoreKit

class MenuController: UIViewController {

    @IBOutlet weak var usrImg: UIImageView!
    @IBOutlet weak var usrLabel: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recuperarNombreEmailUsuario()
    }
    
    func recuperarNombreEmailUsuario(){
        let user = Auth.auth().currentUser
        if let user = user{
            usrLabel?.text = user.displayName
            emailLbl?.text = user.email
            
             print("nombre de usuario: \(String(describing: user.displayName))")
            print("email de usuario: \(String(describing: user.email))")
        }
    }
    
    @IBAction func terminosBtn(_ sender: UIButton) {
        //Terminos
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let restViewController = mainStoryBoard.instantiateViewController(withIdentifier: "TerminosController") as! TerminosController
        self.navigationController?.pushViewController(restViewController, animated: true)
    }
    
    @IBAction func politicasBtn(_ sender: UIButton) {
        //Terminos
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let restViewController = mainStoryBoard.instantiateViewController(withIdentifier: "PoliticasController") as! PoliticasController
        self.navigationController?.pushViewController(restViewController, animated: true)
    }
    
    @IBAction func salirBtn(_ sender: UIButton) {
        //Cerrar Sesión
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            //log error
            print("Hubo error al cerrar sesion de Firebase")
            return
        }
        do{
            try
                authUI?.signOut()
            
            print("Cerro sesion corretamente")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginController")
            self.present(signInVC, animated: true, completion: nil)
        }catch{}
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
