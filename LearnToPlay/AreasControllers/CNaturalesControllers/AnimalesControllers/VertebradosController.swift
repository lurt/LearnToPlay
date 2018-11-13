//
//  VertebradosController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import WebKit

class VertebradosController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var vertebradosWeb: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        vertebradosWeb.navigationDelegate = self
        vertebradosWeb.load(URLRequest(url: URL(string: "https://juegosinfantiles.bosquedefantasias.com/ciencias-naturales/seres-vivos/animales-vertebrados")!))
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }

}
