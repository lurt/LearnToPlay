//
//  SinonimosAntController.swift
//  LearnToPlay
//
//  Created by Lu Ramirez Tlaxcaltecatl on 12/11/18.
//  Copyright © 2018 Lu Ramirez Tlax. All rights reserved.
//

import UIKit
import WebKit

class SinonimosAntController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var sinonimosWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sinonimosWeb.navigationDelegate = self
        sinonimosWeb.load(URLRequest(url: URL(string: "https://juegosinfantiles.bosquedefantasias.com/juego/sinonimos/sinonimos-juego-1")!))
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }

}
