//
//  WebViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 06/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    var passedValue = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: passedValue)
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
    

    
}
