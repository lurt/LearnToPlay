//
//  OperacionesDosController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import WebKit

class OperacionesDosController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var restaWeb: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaWeb.navigationDelegate = self
        restaWeb.load(URLRequest(url: URL(string: "https://juegosinfantiles.bosquedefantasias.com/juegos/matematicas/resta-hasta-10/index.html")!))

    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    
}
