//
//  ProfesionesController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import WebKit

class ProfesionesController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var profesionesWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profesionesWeb.navigationDelegate = self
        profesionesWeb.load(URLRequest(url: URL(string: "https://juegosinfantiles.bosquedefantasias.com/lengua-literatura/vocabulario/adivina-profesion")!))
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    
}
