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
import FirebaseStorage
import GoogleSignIn
import FacebookLogin
import FacebookCore
import FBSDKLoginKit
import FBSDKCoreKit

class MenuController: UIViewController {

    @IBOutlet weak var usrImg: UIImageView!{
        didSet {
            usrImg.layer.cornerRadius = usrImg.bounds.size.width / 2.0
            usrImg.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var usrLabel: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recuperarNombreEmailUsuario()
        obtenerFotoUsuario()
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
    
    func obtenerFotoUsuario(){
        let user = Auth.auth().currentUser
        
        //obtenemos la referencia de storage para la imagen
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let profilePicRef = storageRef.child("/User Profile Pictures/"+(user?.uid)!+"/profile_pic.jpg")
        
        //obteniendo la imagen del usuario de google
        if GIDSignIn.sharedInstance().currentUser != nil {
            let imageUrl = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 400).absoluteString
            let url = NSURL(string: imageUrl)! as URL
            let data = NSData(contentsOf: url)
            
            let uploadTask = profilePicRef.putData(data! as Data, metadata: nil){
                (metadata, error) in
                guard let metadata = metadata else {
                    return
                }
                // Metadata contains file metadata such as size, content-type.
                let size = metadata.size
                // You can also access to download URL after upload.
                storageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        // Uh-oh, an error occurred!
                        return
                    }
                }
            }
            self.usrImg.image = UIImage(data: data! as Data)
            
            //recuperando la imagen del usuario de facebook
        }else if FBSDKAccessToken.current() != nil {
            print(FBSDKAccessToken.current().permissions)
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            let connection = FBSDKGraphRequestConnection()
            
            connection.add(graphRequest, completionHandler: { (connection, result, error) -> Void in
                
                let data = result as! [String : AnyObject]
                
                let FBid = data["id"] as? String
                
                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                self.usrImg.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
                
            })
            connection.start()
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
