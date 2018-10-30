//
//  ViewController.swift
//  MeiJia
//
//  Created by 江东 on 2018/10/29.
//  Copyright © 2018 oushelun. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string:"https://index.oushelun.cn/meijia.html")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }


}

