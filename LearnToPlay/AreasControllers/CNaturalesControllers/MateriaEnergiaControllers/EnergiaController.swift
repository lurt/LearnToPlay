//
//  EnergiaController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import WebKit

class EnergiaController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var energiaWeb: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        energiaWeb.navigationDelegate = self
        energiaWeb.load(URLRequest(url: URL(string: "https://juegosinfantiles.bosquedefantasias.com/ciencias-naturales/materia-energia/estados-materia")!))
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    
}
